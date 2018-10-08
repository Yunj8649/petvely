package egovframework.example.product.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.example.cmmn.JsonUtil;
import egovframework.example.product.service.ProductMgrVO;
import egovframework.example.product.service.ProductService;
import egovframework.example.product.service.TAB_PROD_VO;
import egovframework.rte.psl.dataaccess.util.EgovMap;

@Service("productService")
public class ProductServiceImpl implements ProductService{
	
	@Resource(name="productMapper")
	private ProductMapper productMapper;
	
	private String saveImage;
	
	/**** 상품 추가 ****/
	@Override
	public void insertProduct(TAB_PROD_VO vo, MultipartHttpServletRequest mRequest) throws Exception {
		
		System.out.println(mRequest.getFile("prImg1").getOriginalFilename());
		System.out.println(mRequest.getFile("prImg2").getOriginalFilename());

		if(fileUpload(vo,mRequest)){
			
			System.out.println("파일 업로드 성공");
			
//			if( mRequest.getFile("prImg2") != null){
//				vo.setPrImg2(saveImage[1]);
//			}
			
			productMapper.insertProduct(vo);
			
		} else {
			System.out.println("파일 업로드 실패");
			return;
		}
	}
	
	/**** 상품 수정 ****/
	@Override
	public List<EgovMap> selectProductList(TAB_PROD_VO vo) throws Exception {
		return productMapper.selectProductList(vo);
	}
	
	/**** 상품 삭제 ****/
//	@Override
//	public void deleteProduct(TAB_PROD_VO vo, MultipartHttpServletRequest mRequest) throws Exception {
//		productMapper.deleteProduct(vo);
//	}
	
	/* [상품 조회] 카테고리 조회 */
	@Override
	public List<EgovMap> selectCategoryList() throws Exception {
		return productMapper.selectCategoryList();
	}
	
	/* [상품 조회] 하위 카테고리 조회 */
	@Override
	public List<EgovMap> prdMgrChildBoxList(String string) throws Exception {
		return productMapper.prdMgrChildBoxList(string);
	}
	
	/* [상품 조회] jqGrid 조회 */
	@Override
	public List<EgovMap> selectJqgridList(ProductMgrVO productMgrVO) throws Exception {
		return productMapper.selectJqgridList(productMgrVO);
	}
	
	/* [상품 조회] jqGrid count */
	@Override
	public EgovMap selectJqgridListCnt(ProductMgrVO productMgrVO) throws Exception {
		return productMapper.selectJqgridListCnt(productMgrVO);
	}
	
	/* [상품 조회] jqGrid */
	@Override
	public void ctrlJqgridTx(JSONArray jsonArray) throws Exception {
		int iLength = jsonArray.length();
		
		try {
			for (int i = 0; i < iLength; i++) {
				JSONObject jsonObject = jsonArray.getJSONObject(i);
				
				Map<String, Object> param = JsonUtil.JsonToMap(jsonObject.toString());
				
				if("del".equals(param.get("ctrlType"))) {
					productMapper.deleteJqgridList(param);
				}
			}
		} catch (Exception e) {
			
		}
	}
	
	/* [상품 수정] 상위 카테고리 조회 */
	@Override
	public List<EgovMap> selectCtList() throws Exception {
		return productMapper.selectCtList();
	}
	
	/* [상품 수정] 하위 카테고리 조회 */
	@Override
	public List<EgovMap> selectSubCtList(String string) throws Exception {
		return productMapper.selectSubCtList(string);
	}
	
	/* [상품 수정] 파일 선택 */
	public boolean fileUpload(TAB_PROD_VO vo, MultipartHttpServletRequest mRequest) {
		int i				= 0;
		boolean isSuccess	= false;
		
		String uploadPath = "C:/eGovFrameDev-3.6.0-64bit/workspace/petvely/src/main/webapp";
		String uploadPathUser = "/user-upload/file/main_img";
		uploadPath += uploadPathUser;
		File dir = new File(uploadPath);

		if (!dir.isDirectory()) {
			dir.mkdirs();
		}
		
		Iterator<String> iter = mRequest.getFileNames();

		while(iter.hasNext()) {
			
			String uploadFileName = iter.next();
			MultipartFile mFile = mRequest.getFile(uploadFileName);

			String originalFileName = mFile.getOriginalFilename();
			String saveFileName = originalFileName;
			String extName = saveFileName.substring(saveFileName.lastIndexOf(".")+1 );

			if(saveFileName != null && !saveFileName.equals("")) {

				if(new File(uploadPath + "/"+ saveFileName).exists()) {
					saveFileName = saveFileName.substring(0,saveFileName.lastIndexOf(".")) 
							+ "_" + System.currentTimeMillis() + "." + extName;
				}
				
				try {
					System.out.println("원본 파일 이름:" + originalFileName);
					System.out.println("저장 파일 이름:" + saveFileName);
					
					mFile.transferTo(new File(uploadPath + "/" + saveFileName));
					isSuccess = true;
					saveImage = "." + uploadPathUser + "/"+ saveFileName;
					
					if (i == 0) {
						vo.setPrImg1(saveImage);
					} else {
						vo.setPrImg2(saveImage);
					}
					i++;
				} catch (IllegalStateException e) {
					e.printStackTrace();
					isSuccess = false;
				} catch (IOException e) {
					e.printStackTrace();
					isSuccess = false;
				} catch (Exception e) {
					e.printStackTrace();
				}
			} // if end

		} // while end

		return isSuccess;
	} // fileUpload end

}
