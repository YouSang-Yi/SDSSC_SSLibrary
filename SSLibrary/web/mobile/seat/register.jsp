<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String receiver_uid = (String) request.getAttribute("receiver_uid");
	String receiver_sid = (String) request.getAttribute("receiver_sid");
%>
<script>

function	 sendMsgImpl(f){
	// ������ �¼� ����
	var s_id = f.receiver_sid.value;
	// �߽���
	var sender_id = f.sender_uid.value;
	// ����
	var text = f.textarea.value;
	
	alert("s_id: " +s_id  + ", sender_id: " + sender_id + ", text: "+ text);
	
	var c = confirm(s_id + "�� �ڸ��� ����ڿ��� �޼����� �����ðڽ��ϱ�?");
	if (c == true) {
		$.ajax({
			type : 'post',
			data : {
				's_id_str' : s_id,
				'sender_id' : sender_id,
				'text': text
			},
			async : 'false',
			url : 'msgsendimpl.do',
			success : function(data) {
				alert(s_id + "�� �¼����� �޼����� �����Ͽ����ϴ�.");
				showSeatList(f);
			},
			error : function() {
				alert("������ ���� �޼����� ���۵��� �ʾҽ��ϴ�.");
			}
		});
	}	

}

</script>
<h4>�߽���: ${user.id}(${user.name}) </h4>
<form>
	<input type="hidden" name="sender_uid" value="${user.id}">
	<input type="hidden" name="receiver_sid" class="seatid">
	<textarea rows="2" cols="70" name="textarea"></textarea>
	<br>	
	<div class="modal-footer">		
		<button type="button" class="btn btn-default" data-dismiss="modal" name="Nbtn" id="Nbtn" value="������" onclick="sendMsgImpl(this.form);">������</button>
 		<button type="button" class="btn btn-default" data-dismiss="modal">�ݱ�</button>
	</div>
</form>