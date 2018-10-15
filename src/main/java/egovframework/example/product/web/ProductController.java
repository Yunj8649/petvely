package egovframework.example.product.web;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.product.service.ProductMgrVO;
import egovframework.example.product.service.ProductService;
import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Controller
public class ProductController {
	@Resource(name="productService")
	private ProductService productService;
	
	/**** 상품 조회 페이지 ****/
	@RequestMapping(value="productMgr.do")
	public String productMgr() throws Exception {
		return "admin/product/productMgr.tiles";
	}
	
	/**** 상품 수정 페이지 ****/
	@RequestMapping(value = "prdInsert.do")
	public String admin_prod(ModelMap model) throws Exception {
		System.out.println("admin_prod()");
		return "admin/product/prdInsert.tiles";
	}
	
//	
//	/**** 상품 수정 완료 페이지 ****/
//	@RequestMapping(value = "fileResult.do")
//	public String fileResult(ModelMap model) throws Exception {
//		System.out.println("fileResult()");
//		return "admin/product/fileResult.tiles";
//	}
	
	/**** 상품 등록 ****/
	@RequestMapping(value = "product_insert.do")
	public String prod_insert(@ModelAttribute TAB_PROD_VO vo,BindingResult result, 
			MultipartHttpServletRequest mRequest, ModelMap model) throws Exception {
		
		System.out.println("prod_insert()");
		
		productService.insertProduct(vo,mRequest);
		
		String msg = "상품 등록이 완료되었습니다.";
        
		model.put("msg", msg);
		return "admin/product/productMgr.tiles";
	}

	/**** 상품 수정 ****/
	@RequestMapping(value = "prdModify.do")
	public String productList(HttpServletRequest request, ModelMap model) throws Exception {
		
		System.out.println("updateProduct()");
		
		int prCd = Integer.parseInt(request.getParameter("prCd"));
	
		TAB_PROD_VO vo = new TAB_PROD_VO();
		
		vo.setPrCd(prCd);
		
		List<EgovMap> productList = productService.selectProductList(vo);
		model.addAttribute("productList" , productList);
		
		return "admin/product/prdModify.tiles";
	}
/*	
	@RequestMapping(value = "product_update.do")
	public String productList(HttpServletRequest request, ModelMap model) throws Exception {
		
		System.out.println("updateProduct()");
		
		int prCd = Integer.parseInt(request.getParameter("prCd"));
	
		TAB_PROD_VO vo = new TAB_PROD_VO();
		
		vo.setPrCd(prCd);
		
		List<Map> productList = productService.productList(vo);
		model.addAttribute("productList" , productList);
		
		return "admin/product/prdModify.tiles";
	}*/
	/**** 상품 삭제 ****/
//	@RequestMapping(value = "product_delete.do")
//	public void prod_delete(@ModelAttribute TAB_PROD_VO vo,BindingResult result,MultipartHttpServletRequest mRequest) throws Exception {
//		System.out.println("prod_delete()");
//		productService.deleteProduct(vo,mRequest);
//	}
	
	/* [상품 조회] 카테고리 조회 */
	@ModelAttribute("ctBoxList")
	public List<EgovMap> categoryList(ModelMap model) throws Exception {
		return productService.selectCategoryList();
	}
	
	/* [상품 조회] 하위 카테고리 조회 */
	@RequestMapping(value = "subCtBoxList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String subCtBoxList(@RequestBody String param) throws Exception {
		
		String prCdString = JsonUtil.JsonToMap(param).get("param").toString();
		HashMap<String, Object> resMap = new HashMap<String, Object>();	
		
		try {
			List<EgovMap> childList = productService.
					prdMgrChildBoxList(prCdString);

			if(!prCdString.isEmpty()){	// 
				resMap.put("result", "PRCDOK");
			} else {
				resMap.put("result", "PRCDNO");
			}
			if( childList.size() != 0 )
				resMap.put("childList", childList);
		} catch (Exception e) {
		}
		System.out.println(resMap);
		return JsonUtil.HashMapToJson(resMap).toString();
	}
	
	/* [상품 조회] jqGrid */
	@RequestMapping(value="ctrlJqgrid.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String ctrlJqgrid(@RequestParam String param) throws Exception {
		String result = "";
		try {
			param = param.replaceAll("&quot;", "\"");
			System.out.println(param);
			
			// json object string type은 for 못돌리니깐
			// object 타입으로 바꾼다
			
			JSONArray jsonArray = new JSONArray(param);
			
			productService.ctrlJqgridTx(jsonArray);
			
			result = "SUCCESS";
		} catch (Exception e) {
			
		}
		return JsonUtil.OneStringToJson(result);
	}
	
	/* [상품 조회] jqGrid 조회 */
	@RequestMapping(value="productMgrMain.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String productMgrMain(@ModelAttribute ProductMgrVO productMgrVO) throws Exception {
		HashMap<String, Object> resMap = new HashMap<String, Object>();
		
		try { 	
			String xssParseStr = productMgrVO.getParam().replaceAll("&quot;", "\"");
			
			System.out.println(xssParseStr);
			
			productMgrVO.setSelectedCategory((String) JsonUtil.JsonToMap(xssParseStr).get("selectedCategory"));
			productMgrVO.setSelectedSubCategory((String) JsonUtil.JsonToMap(xssParseStr).get("selectedSubCategory"));
			
			System.out.println("rows : " + productMgrVO.getRows());
			
			System.out.println(productMgrVO.getSord());
			
			List<EgovMap> jqGridList = productService.selectJqgridList(productMgrVO);
			
			EgovMap jqGridListCnt = productService.selectJqgridListCnt(productMgrVO);

			resMap.put("rows", 		jqGridList);
			resMap.put("page", 		productMgrVO.getPage());
			resMap.put("total", 	jqGridListCnt.get("totalpage"));
			resMap.put("records", 	jqGridListCnt.get("totaltotcnt"));
			
			System.out.println("out prdmgrController : " + JsonUtil.HashMapToJson(resMap).toString());
		} catch (Exception e) {
			
		}
		return JsonUtil.HashMapToJson(resMap).toString();
	}
	
	/* [상품 수정] 카테고리 조회 */
	@ModelAttribute("ctList") 
	public List<EgovMap> parentList(ModelMap model) throws Exception{
		return productService.selectCtList();
	}

	/* [상품 수정] 하위 카테고리 조회 */
	@RequestMapping(value = "/categorySelect.do", method = RequestMethod.POST)
	public void prdList(HttpServletResponse response, @RequestBody String param) throws Exception {
		
		Map<String, Object> paramMap = JsonUtil.JsonToMap(param);
		HashMap<String, Object> resMap = new HashMap<String, Object>(); 
		
		paramMap = JsonUtil.JsonToMap(param);
		System.out.println(paramMap.get("param"));
		
		try{
			List<EgovMap> childList = productService.
					selectSubCtList(paramMap.get("param").toString());
			
			resMap.put("result", "SUCCESS");
			resMap.put("list", childList);
		} catch (Exception e){
			
		}
		
		PrintWriter out = null;
		
		response.setCharacterEncoding("UTF-8");
		out = response.getWriter();
		out.write(JsonUtil.HashMapToJson(resMap));
	}
}
