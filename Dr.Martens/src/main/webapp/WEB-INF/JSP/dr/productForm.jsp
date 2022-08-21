<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>������ ������ : �������� ���</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/resources/css/admin.css">
    <script src="/resources/js/main.js"></script>
</head>
<body>
    <header id="header">
        <div class="inner">
<div class="img_wrap"> <a href="/admin/main" ><img src="/resources/img/logo.svg" alt=""> </a></div>
            <div class="title_wrap"> <span>���͸�ƾ ������������</span> </div>
            <div class="controller_wrap">
                <div class="log_out">
                    <div class="welcome">
                    	<span class="time sml gray">�α��� : ${time}</span>
                        <span>�����ڴ� �ȳ��ϼ��� : )</span>
                    </div>
                    <button type="button">�α׾ƿ�</button>
                </div>
                <div class="search_box">
                    <div class="dmField_input_box">
                        <input name="userid" type="text" class="dmField_input" placeholder="�˻�" >
                        <button type="button" class="cmBtn line yellow">�˻�</button>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="wrap">
        <div id="gnb">
            <ul id="menu">
                <li> <span>�� ����</span> <span class="off"><i class="fa-solid fa-chevron-down"></i></span> <span class="on"><i class="fa-solid fa-chevron-up"></i></span>
                    <div class="sub_wrap">
                        <ul id="sub_menu">
                            <li><a href="#">����1</a></li>
                            <li><a href="#">����2</a></li>
                            <li><a href="#">����3</a></li>
                            <li><a href="#">����4</a></li>
                        </ul>
                    </div>
                </li>
                <li> <span>�Խ��� ����</span> <span class="off"><i class="fa-solid fa-chevron-down"></i></span> <span class="on"><i class="fa-solid fa-chevron-up"></i></span>
                    <div class="sub_wrap">
                        <ul id="sub_menu">
                            <li><a href="/admin/notice/list">�������� ����</a></li>
                            <li><a href="/admin/notice/write">�������� �ۼ�</a></li>
                            <li><a href="/admin/myqna/list">1:1���� ����</a></li>
                            <li><a href="/admin/qa/write">���ֹ��� ���� �ۼ�</a></li>
                            <li><a href="/admin/qa/list">���ֹ��� ���� ����</a></li>
                        </ul>
                    </div>
                </li>
                <li> <span>��ǰ ����</span> <span class="off"><i class="fa-solid fa-chevron-down"></i></span> <span class="on"><i class="fa-solid fa-chevron-up"></i></span>
                    <div class="sub_wrap">
                        <ul id="sub_menu">
                            <li><a href="/admin/product/form">��ǰ ���</a></li>
                            <li><a href="#">��ǰ ���</a></li>
                        </ul>
                    </div>
                </li>
                <li> <span>�ֹ� ����</span> <span class="off"><i class="fa-solid fa-chevron-down"></i></span> <span class="on"><i class="fa-solid fa-chevron-up"></i></span>
                    <div class="sub_wrap">
                        <ul id="sub_menu">
                            <li><a href="#">��ü�ֹ����</a></li>
                        </ul>
                    </div>
                </li>
                <li><span>���м�</span></li>
            </ul>
        </div>
        </div>
        <div id="main">
            <div class="container">
                <div class="inner">
					<!-- ��ǰ ��� �� �Դϴ�. -->
					<form action="/DrMarten/product/files/add" method="post"
						enctype="multipart/form-data" id="product_form">
						<h2 class="title">��ǰ ���</h2>
			            <div class="dmField dmInput w10">
			            	<label class="dmField_label">�з�</label>
			            	<select name="gender" class="dmField_select">
			                	<option>����</option>
			                	<option>����</option>
			                	<option>ȥ��</option>
			                </select>
			            </div>
			            <div class="dmField dmInput w10">
			            	<label class="dmField_label">ī�װ�</label>
			            	<select name="category" class="dmField_select">
			                	<option>sandals</option>
			                	<option>boots</option>
			            </select>
			            </div>	
						<div class="dmField dmInput name">
							<label class="dmField_label">��ǰ�̸�</label>
						    <input type="text" name="name" value="" class="dmField_input" placeholder="��ǰ_�̸���_�Է����ּ���">
						</div>
						<div class="dmField dmInput mb30">
							<label class="dmField_label">��ǰ �̹���</label>
							<input type="file" name="files" multiple="multiple" class="dmField_input">
						</div>
						<div class="dmField dmInput w33">
							<label class="dmField_label">��������</label>
						    <input type="text" name="made" value="" class="dmField_input" placeholder="��������">
						</div>
								<div class="dmField dmInput w33">
							<label class="dmField_label">�����</label>
						    <input type="text" name="material" value="" class="dmField_input" placeholder="�����">
						</div>
								<div class="dmField dmInput w33">
							<label class="dmField_label">����</label>
							<select name="color" class="dmField_select">
			                	<option>black</option>
			                	<option>brown</option>
			                	<option>gray</option>
			                	<option>white</option>
			                	<option>beige</option>
			                	<option>green</option>
			                	<option>yellow</option>
			                	<option>deep-brown</option>
			                	<option>khaki</option>
			                	<option>burgundy</option>
			            </select>
						</div>				
			            <div class="dmField dmInput">
							<label class="dmField_label">����</label>
						    <input type="text" name="price" value="" class="dmField_input" placeholder="����">
						</div>
						<div class="size_count_wrap">
							<div class="size_count_sub">
							            <div class="dmField dmInput">
							<label class="dmField_label">������</label>
							<select name="size[0].product_size" class="dmField_select">
			                	<option>220</option>
			                	<option>230</option>
			                	<option>240</option>
			                	<option>250</option>
			                	<option>260</option>
			                	<option>270</option>
			                	<option>280</option>
			                	<option>290</option>
			            	</select>
						</div>
			            <div class="dmField dmInput">
							<label class="dmField_label">����</label>
						    <input type="text" name="size[0].product_count" value="" class="dmField_input">
						</div>
							</div>
							<div class="size_count_sub">
							            <div class="dmField dmInput">
							<label class="dmField_label">������</label>
							<select name="size[1].product_size" class="dmField_select">
			                	<option>220</option>
			                	<option>230</option>
			                	<option>240</option>
			                	<option>250</option>
			                	<option>260</option>
			                	<option>270</option>
			                	<option>280</option>
			                	<option>290</option>
			            	</select>
						</div>
			            <div class="dmField dmInput">
							<label class="dmField_label">����</label>
						    <input type="text" name="size[1].product_count" value="" class="dmField_input">
						</div>
							</div>
						</div>
                        <div class="btn_wrap">
                            <button type="reset" class="cmBtn black sml">���</button>
                            <button type="submit" class="cmBtn black sml">����</button>
                        </div>
				</form>
			</div>
    	</div>
	</div>
</body>
</html>