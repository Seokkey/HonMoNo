 <%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ȸ������ â</title>
<style>
		table{
			margin: 50px 20px;
			right: 100px;
		}
		
		#hak{
			position: absolute;
			right:9%;
			top:18%;
		}
</style>
</head>
<body>
<jsp:include page="../memberLoginBox.jsp"/>
<br>
<br>
<br>
<div id="hak">
<form action="./memberJoinForm2" name="JoinAgree" method="GET" onsubmit="return checkCheckBox(this)">

 <table width="1400" height="650">
  <tr>
   <td width="100%" height="10%"><span style="padding-left: 160px">
   </span>&nbsp; <b>����� ȸ������</b>
    <br>
    <hr>
   </td>
  </tr>
  <tr>
   <td width="100%" height="50%" align="center">
   <p align="left">
   <span style="padding-left: 160px">
  	ȸ����� ����</span>
   </p>
   <br/>
    <textarea rows="20" cols="150" readonly="readonly" style="text-align: left;">
�� 1 �� ��Ģ
    	
�� 1 �� (����)


�� ����� ȥ���(ȥ�� ����) ����Ʈ�� �����ϴ� ��� ����(���� "����")�� �̿����� �� ����, �̿��ڿ� ȥ���(ȥ�� ����) ����Ʈ�� �Ǹ�, �ǹ�, å�ӻ��װ� ��Ÿ �ʿ��� ������ �������� �������� �մϴ�.

�� 2 �� (����� ȿ�°� ����)

1. ȥ���(ȥ�� ����) ����Ʈ�� ���ϰ� �� ��� ���뿡 �����ϴ� ���, ȥ���(ȥ�� ����) ����Ʈ�� ���� ���� ���� �� ������ ���� ��� ������ �� ����� �켱������ ����˴ϴ�.
2. ȥ���(ȥ�� ����) ����Ʈ�� �� ����� ���� ���� ���� ������ �� �ְ�, ����� ����� ȥ���(ȥ�� ����) ����Ʈ ���� �����ϰų� e-mail�� ���� ȸ������ �����ϸ�, ������ ���ÿ� �� ȿ���� �߻��˴ϴ�. �̿��ڰ� ����� ����� �������� �ʴ� ���, �̿��ڴ� ������ ȸ������� ���(ȸ��Ż��)�� �� ������ ��� ����� ���� ��� ���濡 ���� ���Ƿ� ���ֵ˴ϴ�.


�� 3 �� (��� �� ��Ģ)

1. �� ����� ���õ��� ���� ������ ������ű⺻��, ������Ż����, ���������������ȸ ���Ǳ���, ���� ��� ��������, ���α׷���ȣ�� �� ��Ÿ ���� ������ ������ ���մϴ�.
2. ���� : �Һ��ڿ� Ȩ�������� �����ϴ� ��û�� ��Ŀ� �ش� ������ �����ϰ�, �� ����� �����Ͽ� ���� �̿����� �Ϸ��Ű�� ����
3. ����� ȸ�� : �Һ��ڿ� Ȩ�������� ����� ȸ�����Կ� �ʿ��� ����� ������ �����Ͽ� ����� ȸ�� ����� �� �ڷμ�, �Һ��ڿ� Ȩ�������� ���� �� ���񽺸� �̿��� �� �ִ� ��
4. �̿��ڹ�ȣ(ID) : �̿������ �ĺ��� �̿��ڰ� ���� �̿��� ���Ͽ� �̿��ڰ� �����ϰ� �Һ��ڿ� Ȩ�������� �ο��ϴ� ���ڿ� ������ ������ ���մϴ�.
5. ��й�ȣ(PW) : �̿��ڰ� ��ϻ���� ȸ���� ���������� �ſ��� Ȯ���ϰ� ��Ż��� �ڽ��� ����������ȣ�� ���Ͽ� �̿��� �ڽ��� ������ ���ڿ� ������ ����
6. Ż��(����) : ����� ȸ���� �̿����� �����Ű�� ����
7. �� ������� �������� ���� ���� �������񽺿� ���� ������� �� �̿�������� �����մϴ�.

�� 4 �� (����� ����)


�� ������� ����ϴ� ����� ���Ǵ� ������ �����ϴ�.

1. �̿��� : �� ����� ���� ȥ���(ȥ�� ����) ����Ʈ�� �����ϴ� ���񽺸� �޴� ��.
2. ���� : ȥ���(ȥ�� ����) ����Ʈ�� �����ϴ� ��û�� ��Ŀ� �ش� ������ �����ϰ�, �� ����� �����Ͽ� ���� �̿����� �Ϸ��Ű�� ����.
3. ȸ�� : ȥ���(ȥ�� ����) ����Ʈ�� ���� ������ �����Ͽ� ȸ�� ����� �� �ڷμ� ȥ���(ȥ�� ����) ����Ʈ�� �����ϴ� ���񽺸� �̿��� �� �ִ� ��.
4. ��й�ȣ : �̿��ڿ� ȸ��ID�� ��ġ�ϴ����� Ȯ���ϰ� ��Ż��� �ڽ��� ��к�ȣ�� ���Ͽ� �̿��� �ڽ��� ������ ���ڿ� ������ ����.
5. Ż�� : ȸ���� �̿����� �����Ű�� ����.


�� 2 �� ���� ���� �� �̿�


�� 5 �� (�̿����� ����)

1. �̿����� ��û�ڰ� �¶������� ȥ���(ȥ�� ����) ����Ʈ���� �����ϴ� ������ ���Խ�û ��Ŀ��� �䱸 �ϴ� ������ ����Ͽ� ������ �Ϸ��ϴ� ������ �����˴ϴ�.
2. ȥ���(ȥ�� ����) ����Ʈ�� ���� �� ȣ�� �ش��ϴ� �̿��࿡ ���Ͽ��� ������ ����� �� �ֽ��ϴ�.
1) �ٸ� ����� ���Ǹ� ����Ͽ� ��û�Ͽ��� ��
2) �̿��� ��û���� ������ ������ �����Ͽ��ų� ��û�Ͽ��� ��
3) �ٸ� ����� ȥ���(ȥ�� ����) ����Ʈ ���� �̿��� �����ϰų� �� ������ �����ϴ� ���� ������ �Ͽ��� ��
4) ȥ���(ȥ�� ����) ����Ʈ�� �̿��Ͽ� ���ɰ� �� ����� �����ϴ� ������ �ϴ� ���
5) ��Ÿ ȥ���(ȥ�� ����) ����Ʈ�� ���� �̿��û����� �̺� �Ǿ��� ��


�� 6 �� (ȸ������ ��뿡 ���� ����)

1. ȸ���� ���������� ����������ȣ���� ���� ��ȣ�˴ϴ�.
2. ȥ���(ȥ�� ����) ����Ʈ�� ȸ�� ������ ������ ���� ���, ����, ��ȣ�˴ϴ�.
1) ���������� ��� : ȥ���(ȥ�� ����) ����Ʈ�� ���� ������ �����ؼ� ������ ȸ���� �Ż������� ������ �³� ���� ��3�ڿ��� ����, �������� �ʽ��ϴ�. ��, ������ű⺻�� �� ������ ������ ���� ��������� �䱸�� �ִ� ���, ���˿� ���� ������� ������ �ְų� ����������� ����ȸ�� ��û�� �ִ� ��� �Ǵ� ��Ÿ ������ɿ��� ���� ������ ���� ��û�� �ִ� ���, ���ϰ� ȥ���(ȥ�� ����) ����Ʈ�� ������ ���������� ������ ������ ��쿡�� �׷����� �ʽ��ϴ�.
2) ���������� ���� : ���ϴ� ���������� ��ȣ �� ������ ���Ͽ� ������ ���������������� ���÷� ������ ���������� ����/������ �� �ֽ��ϴ�.
3) ���������� ��ȣ : ������ ���������� ���� ���ϸ��� ����/����/���� �� �� ������, �̴� �������� ������ ID�� ��й�ȣ�� ���� �����ǰ� �ֽ��ϴ�. ���� Ÿ�ο��� ������ ID�� ��й�ȣ�� �˷��־�� �ȵǸ�, �۾� ����ÿ��� �ݵ�� �α׾ƿ� �� �ֽñ� �ٶ��ϴ�.
3. ȸ���� �� ����� ���� �̿��û�� �ϴ� ����, ȥ���(ȥ�� ����) ����Ʈ�� ��û���� ����� ȸ�������� ����, �̿��ϴ� �Ϳ� �����ϴ� ������ ���ֵ˴ϴ�.


�� 7 �� (������� ���� ����)

1. ���� ��û�ڰ� ȥ���(ȥ�� ����) ����Ʈ ���� ���� ������ �Ϸ��ϴ� �������� ���ϴ� �Է��� ������ ����� ������ å���� ������, ȸ���� ID�� ��й�ȣ�� ����Ͽ� �߻��ϴ� ��� ����� ���� å���� ȸ�� ���ο��� �ֽ��ϴ�.
2. ID�� ��й�ȣ�� ���� ��� ������ å���� ȸ������ ������, ȸ���� ID�� ��й�ȣ�� �����ϰ� ��� �Ǿ��ٴ� ����� �߰��� ��쿡�� ��� ȥ���(ȥ�� ����) ����Ʈ�� �Ű��Ͽ��� �մϴ�. �Ű��� ���� �������� ���� ��� å���� ȸ�� ���ο��� �ֽ��ϴ�.
3. �̿��ڴ� ȥ���(ȥ�� ����) ����Ʈ ������ ��� ����� ���� ��Ȯ�� ������ �����ؾ� �ϸ�, ��Ȯ�� ���� ���� �ƴ������ν� ��3�ڰ� ���Ͽ� ���� ������ �̿��ϰ� �Ǵ� ���� ����� ���� �߻��ϴ� ���� �� �սǿ� ���Ͽ� ȥ���(ȥ�� ����) ����Ʈ�� å���� �δ����� �ƴ��մϴ�.


�� 8 �� (������ ����)

1. ȥ���(ȥ�� ����) ����Ʈ�� �̿��ڰ� �� ����� ���뿡 ����Ǵ� �ൿ�� �� ���, ���Ƿ� ���� ����� ���� �� ������ �� �ֽ��ϴ�.


�� 9 �� (������ ���� �� ����)

1. ȥ���(ȥ�� ����) ����Ʈ�� ���ϰ� ���񽺸� �̿��Ͽ� ����ϴ� �����̳� ���񽺸� ���Ͽ� ���� �ڷ�� ���� ���ؿ� ���Ͽ� å���� ���� ������, ȸ���� �� ���񽺿� ������ ����, �ڷ�, ����� �ŷڵ�, ��Ȯ�� �� ���뿡 ���Ͽ��� å���� ���� �ʽ��ϴ�.
2. ȥ���(ȥ�� ����) ����Ʈ�� ���� �̿�� �����Ͽ� �����ڿ��� �߻��� ���� �� �������� ����, ���ǿ� ���� ���ؿ� ���Ͽ� å���� �δ����� �ƴ��մϴ�.


�� 10 �� (�Խù��� ���۱�)

1. ���ϰ� �Խ��� �Խù��� ���뿡 ���� �Ǹ��� ���Ͽ��� �ֽ��ϴ�.
2. ȥ���(ȥ�� ����) ����Ʈ�� �Խõ� ������ ���� ���� ���� ����, �̵��� �� �ִ� �Ǹ��� �����ϸ�, �Խ��ǿ ��Ģ�� ���� ���� ���� ���� ������ �� �ֽ��ϴ�.
3. ������ �Խù��� Ÿ���� ���۱��� ħ�������ν� �߻��ϴ� ��, ������� å���� �������� ���ϰ� �δ� �Ͽ��� �մϴ�.


�� 3 �� �ǹ� �� å��


�� 11 �� (ȥ���(ȥ�� ����) ����Ʈ�� �ǹ�)

1. ȥ���(ȥ�� ����) ����Ʈ�� ȸ���� ���� �Ż� ������ ������ �³����� Ÿ�ο��� ����, �������� �ʽ��ϴ�. �ٸ�, ������Ű��ù��� �� ������ɿ� ���Ͽ� ���� ������� ���� �䱸�� �ִ� ��쿡�� �׷����� �ƴ��մϴ�.


�� 12 �� (ȸ���� �ǹ�)

1. ȸ�� ���Խÿ� �䱸�Ǵ� ������ ��Ȯ�ϰ� �����Ͽ��� �մϴ�. ���� �̹� ������ ���Ͽ� ���� ������ ��Ȯ�� ������ �ǵ��� ����, �����Ͽ��� �ϸ�, ȸ���� �ڽ��� ID �� ��й�ȣ�� ��3�ڿ��� �̿��ϰ� �ؼ��� �ȵ˴ϴ�.
2. ȸ���� ȥ���(ȥ�� ����) ����Ʈ�� ���� �³� ���� ���񽺸� �̿��Ͽ� ��� ���������� �� �� �����ϴ�.


�� 4 �� ��Ÿ


�� 13 �� (�絵����)

1. ȸ���� ������ �̿����, ��Ÿ �̿��� �� ������ Ÿ�ο��� �絵, ������ �� �����ϴ�.


�� 14 �� (���ع��)

1. ȥ���(ȥ�� ����) ����Ʈ�� ����� �����Ǵ� ���񽺿� �����Ͽ� ȸ������ ��� ���ذ� �߻��ϴ��� ȥ���(ȥ�� ����) ����Ʈ�� ���Ƿ� ���� ���������� �����ϰ� �̿� ���Ͽ� å���� �δ����� �ƴ��մϴ�.


�� 15 �� (��å����)

1. ȥ���(ȥ�� ����) ����Ʈ�� ȸ���̳� ��3�ڿ� ���� ǥ��� �ǰ��� �����ϰų� �ݴ��ϰų� �������� �ʽ��ϴ�. ȥ���(ȥ�� ����) ����Ʈ�� ��� ���� ȸ���� ���񽺿� ��� ������ ������ ���� �̵��̳� ���� ���ؿ� ���� å���� �����ϴ�.
2. ȥ���(ȥ�� ����) ����Ʈ�� ȸ���� �Ǵ� ȸ���� ��3�ڰ��� ���񽺸� �Ű��� �Ͽ� ��ǰ�ŷ� Ȥ�� ������ �ŷ� ��� �����Ͽ� ��� å�ӵ� �δ����� �ƴ��ϰ�, ȸ���� ������ �̿�� �����Ͽ� ����ϴ� ���Ϳ� ���Ͽ� å���� �δ����� �ʽ��ϴ�.


�� Ģ
1. (������) �� ����� 2018�� 3�� 12�Ϻ��� ����˴ϴ�.
   </textarea> 
   <br>
   <input type="checkbox"  name="agree">�������� ������ �����Ͻʴϱ�?
   </td>
  </tr>
  <tr>
   <td align="center" valign="top">
    <input type="submit" value="����" id="btn"/>&nbsp;&nbsp;&nbsp;
    <input type="button" value="�������� �ʽ��ϴ�" id="btn" onclick="nochk()"/>
   </td>
  </tr>
 </table>
 </form>
 </div>
</body>
<script type="text/javascript">

	/* function chk(){
	 var req = document.form.req.checked;
	 var num = 0;
	 if(req == true){
	  num = 1;
	  
	 }
	 if(num==1){
	  document.form.submit();
	 }else{
	  alert("�������� ����� �����ϼž� �մϴ�.");
	  location.href="./memberJoinForm"
	 }
	 
} */
 	function nochk(){
	 alert("�������� ������ �����Ͻ� �� �����ϴ�");
	} 
	
	 function checkCheckBox(e){
		if (e.agree.checked == false ) {
			alert('������� üũ�� ���ּ���')
			return false;
		}else
	      	alert('ȸ������ �������� �̵��մϴ�')
	      	location.href="./memberJoinForm2"
			return true;
	} 
	
	
</script>
</html>