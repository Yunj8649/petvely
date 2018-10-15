<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <div class="container help-board-write">
    <table class="table table-bordered">
            <colgroup>
                <col width="15%"/>
                <col width="35%"/>
                <col width="15%"/>
                <col width="35%"/>
            </colgroup>
            <caption>게시글 상세</caption>
            <tbody>
                <tr>
                    <th>글 번호</th>
                    <td>1</td>
                    <th>조회수</th>
                    <td>33</td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>비둘기</td>
                    <th>작성시간</th>
                    <td>2017-12-07</td>
                </tr>
                <tr class="help-board-article">
                    <th>제목</th>
                    <td colspan="3">
                        물건이 안와요
                    </td>
                </tr>
                <tr>
                    <td colspan="4" id="help-board" class="view_text">
                        빨리좀 보내줘요
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <input type="button" value="수정" class="pull-right btn btn-default" onclick="ShowTabex('2')" />
                        <input type="button" value="지우기" class="pull-left"/>
                        <input type="button" value="글 목록" class="pull-right" onclick="ShowTabex('1')"/>
                    </td>
                </tr>                
            </tbody>
        </table>
        </div>


