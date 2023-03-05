<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../_inc/inc_mypage.jsp"%>


<style>
.main {
    width: 100%;
    height: 100%;
    padding: 50px 100px;
    border-left: 1px solid #000;
}
.form_table form { margin:0; }
.form_table td,table,input {font-size:20px; color: #666; line-height: 150%; }
.form_table{
	width:100%;
	border-collapse:separate;
	border-spacing:0px;
	border-top:3px solid #0e9482;
	border-left:1px solid #ddd;
	border-right:1px solid #ddd;
}
.form_table th{
	color:#222;
	font-weight:normal;
	text-align:center;
	padding:15px;
	border-bottom:1px solid #ddd;
	letter-spacing:-0.5pt;
	background:#f9f9f9;
	font-weight:600;
}

.form_table tr {
	height: 100px;
}
.form_table th span{color:#e51d28}
.form_table td{border-bottom:1px solid #ddd; padding:10px; text-align:left}

#idMsg { font-size:0.8em; }
#fontBlue { font-weight:bold; color:blue;}
#fontRed { font-weight:bold; color:Red;}


.form_table input{
font-size: 1em;
    color: #666;
    border: 1px solid #d4d4d4;
    background-color: #fff;
    padding: 11px 5px;
    box-sizing: border-box;
}

.submit_btn{
text-align:center;
width:100%;
margin-top:30px
}
.submit_btn input{
display: inline-block;
    cursor: pointer;
    font-size: 1.2em;
    font-weight:600;
    letter-spacing: -0.3pt;
    color: #fff;
    border: 2px solid #0e9482;
    padding: 0 30px;
    width: 230px;
    line-height: 76px;
    box-sizing: border-box;
    background: #0e9482;
    text-align: center;
    transition: all 0.3s ease-out;
}
.submit_btn input:hover{
background-color:#fff;  color:#0e9482;

    
}
</style>


<script>
function passwordCheckFunction(){
	var password1 = $("#new_pw").val();
	var password2 = $("#new_pw_check").val();
	if(password1 != password2){
		$("#pwMsg").html("<span id='fontRed'>비밀번호가 일치하지 않습니다.</span>");
	} else {
		$("#pwMsg").html("<span id='fontBlue'>비밀번호가 일치합니다.</span>");
	}
}

</script>

<article class="main">
<h3 class="main_title border_none">비밀번호 변경</h3>
	<form class="frmJoin" name="frmJoin" action="change_pw_proc" method="post">
		<div class="joinForm">
			<table width="100%" class="form_table">
				<tbody>
					<tr>
						<th width="30%" >기존 비밀번호</th>
						<td><input type="password" id="old_pw" name="old_pw" /></td>
					</tr>
					<tr>
						<th width="30%" >새로운 비밀번호</th>
						<td><input type="password" id="new_pw" name="new_pw" onkeyup="passwordCheckFunction()"/></td>
					</tr>
					<tr>
						<th width="30%" >비밀번호 확인</th>
						<td><input type="password" id="new_pw_check" name="new_pw_check" onkeyup="passwordCheckFunction()" /></td>
					</tr>
				</tbody>
			</table>
			<span id="pwMsg"></span>
		</div>

		<div class="submit_btn">
			<input type="submit" value="비밀번호 변경" />
		</div>		
	</form>
</article>
</section>
</body>
</html>