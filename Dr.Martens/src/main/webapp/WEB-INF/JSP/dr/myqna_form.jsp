<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>1:1���� �ۼ���</title>
<style type="text/css">

	main{width : 350px; padding: 10px 10px 30px; margin : 50px auto;
	border : 1px solid black; border-radius: 10px; text-align : center;}
	textarea#title{width : 320px; height: 300px;}
	.btn_wrap{margin : 10px auto 0;}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script type="text/javascript">
function save(){
	var serData = $('#write_form').serialize();
	$.ajax({
		url : '/dr/myqna/save',
		method : 'post',
		cache : false,
		data : serData,
		dataType : 'json',
		success : function(res){
			alert(res.saved ? '�ۼ�����' : 'Failed');
			location.href='/dr/myqna/list';
		},
		error : function(xhr, status, err){
			alert(err);
		}
	});
	return false;
}
</script>
</head>
<body>
<main>
<h3>1:1���� �ۼ�</h3>
<form id="write_form" onsubmit="return save();">
<input type="hidden" name="pcode" value="0">
<div>
<label>ī�װ�</label>
	<select name="category" id="category">
		<option>�ֹ�����</option>
		<option>��۰���</option>
		<option>��ȯ/ȯ��</option>
		<option>��ǰ����</option>
		<option>��Ÿ</option>
	</select>
	<label>map���� ��ǰ��ȣ/�ֹ���ȣ �Ѱܹޱ�</label>
	<input type ="hidden" name="product_code" id="product_code" value="1234">
	<input type="hidden" name="order_num" id="order_num" value="2022062801">
	<br>
	
	<label>����</label>
	<input type="text" name="title" id="title" >
</div>
<div>
	<label>����</label>
	<textarea  name="contents" id="contents"></textarea>
</div>
<div class="btn_wrap">
<button type="reset">���</button>
<button type="submit">����</button>
</div>
</form>
</main>
</body>
</html>