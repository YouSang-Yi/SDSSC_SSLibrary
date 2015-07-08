<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	User user = (User) session.getAttribute("user");
	String receiver_uid = (String) request.getAttribute("receiver_uid");
	String receiver_sid = (String) request.getAttribute("receiver_sid");
%>

<script>
	// 좌석 등록 함수	
	function register(f) {
		var s_id = f.s_id.value;
		var c = confirm(s_id + "번 자리를 등록하시겠습니까?");
		
		if (c == true) {
			f.action = "m_userseatregister.do?s_id=" + s_id;
			f.method = "POST";
			f.submit();
		}
	}
	//회원의 메세지 전송 함수
	function sendMsg(f) {
		var s_id = f.s_id.value;
		// 좌석의 id 값 대입
		$(".seatid").val(s_id);
		//메세지 전송 다이얼로그 출력
		$('#sendMsg').popup('open');

	}
	// 예약 못 한 회원이 예약된 좌석을 클릭한 경우
	function registeredSeat() {
		alert("이미 예약된 좌석입니다. ");
	}
	// 사용자가 수리 중인 좌석을 클릭한 경우
	function repairState() {
		alert("수리 중입니다");
	}
	// 예약한 사람이 다른 빈 좌석을 클릭한 경우
	function registeredUser() {
		alert("이미 좌석을 예약하셨습니다.");
	}
	// 메세지 전송
	function sendMsgImpl(f) {
		// 수신자 좌석 정보
		var s_id = f.receiver_sid.value;
		// 발신자
		var sender_id = f.sender_uid.value;
		// 내용
		var text = f.textarea.value;

		var c = confirm(s_id + "번 자리의 사용자에게 메세지를 보내시겠습니까?");
		if (c == true) {
			$.ajax({
				type : 'post',
				data : {
					's_id_str' : s_id,
					'sender_id' : sender_id,
					'text' : text
				},
				async : 'false',
				url : 'm_msgsendimpl.do',
				success : function(data) {
					alert(s_id + "번 좌석으로 메세지를 전송하였습니다.");
					$('#sendMsg').popup('close');
				},
				error : function() {
					alert("오류로 인해 메세지가 전송되지 않았습니다.");
					$('#sendMsg').popup('close');
				}
			});
		}
	}
</script>

<style>
#seattable>form>button {
	width: 27px;
	height: 37px;
	float: left;
	border-color: white;
	margin-top: 0px;
	margin-bottom: 0px;
	padding: 7px 1px 7px 1px;
	line-height: 20px;
	valign: middle;
}

#seattable>form {
	margin-bottom: 0px;
}

#seattable>form>button[name="s_id"]:hover {
	opacity: 0.6;
	border-color: white;
}

#seattable>form>button[name="s_id"]:active {
	opacity: 0.3;
	border-color: white;
	color: white;
}

#seattable>form:nth-child(10n)>button {
	float: none;
	margin: 0 20 0 0;
}

#seattable>form:nth-child(10n-2)>button {
	margin: 0 10 0 0;
}

#seattable>form:nth-child(20n)>button {
	margin: 0 0 50px 0;
}

.y_btn, #seattable>form>.y_btn, #seattable>form>.y_btn:hover, #seattable>form>.y_btn:active,
	#seattable>form>.y_btn:focus {
	background: #CC723D;
}

.n_btn, #seattable>form>.n_btn, #seattable>form>.n_btn:hover, #seattable>form>.n_btn:active,
	#seattable>form>.n_btn:focus {
	background: #300000;
}

.f_btn, #seattable>form>.f_btn, #seattable>form>.f_btn:hover, #seattable>form>.f_btn:active,
	#seattable>form>.f_btn:focus {
	background: #337AB7;
}

.door {
	background: #D4F4FA;
	width: 10px;
	height: 20px;
	border: 0
}
</style>

<h3>열람실 좌석 현황</h3>
<button  class="door"
	style="border-radius: 0 0 20px 0; width : 1px; border-top: 3px solid black;"></button>
<br>
<div id="seattable">
	<c:forEach items="${seatlist}" var="s" varStatus="i">
		<c:choose>

			<c:when test="${user.isadmin == 'n' }">
				<c:choose>
					<c:when test="${myseat == null}">
						<c:choose>
							<c:when test="${s.state == 'y'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										name="s_id" onclick="register(this.form);" value="${s.id}"
										data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
								</form>
							</c:when>
							<c:when test="${s.state == 'n'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										name="s_id" onclick="registeredSeat();" value="${s.id}"
										data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
								</form>
							</c:when>
							<c:when test="${s.state == 'f'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										name="s_id" onclick="repairState();" value="${s.id}"
										data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
								</form>
							</c:when>
						</c:choose>
					</c:when>

					<c:otherwise>
						<c:choose>
							<c:when test="${s.state == 'y'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										value="${s.id}" name="s_id" onclick="registeredUser();"
										data-toggle="button" aria-pressed="false" autocomplete="off">${s.id}</button>
								</form>
							</c:when>
							<c:when test="${s.state == 'n'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										value="${s.id}" name="s_id" onclick="sendMsg(this.form);"
										value="${s.id}" data-toggle="button" aria-pressed="false"
										autocomplete="off">${s.id}</button>
								</form>
							</c:when>
							<c:when test="${s.state == 'f'}">
								<form>
									<input type="hidden" name="s_state" value="${s.state}">
									<button type="button" class="btn btn-primary ${s.state}_btn"
										value="${s.id}" name="s_id" onclick="repairState();"
										value="${s.id}" data-toggle="button" aria-pressed="false"
										autocomplete="off">${s.id}</button>
								</form>
							</c:when>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:when>

			<c:when test="${user == null || user.isadmin == 's'}">
				<form>
					<input type="hidden" name="s_state" value="${s.state}">
					<button type="button" class="btn btn-primary ${s.state}_btn">${s.id}</button>
				</form>
			</c:when>

		</c:choose>
	</c:forEach>
</div>
<!--   Sending Message Part (User) -->
<div data-role="popup" id="sendMsg">
	<div data-role="header">
		<h1>메세지전송</h1>
		<p>발신자: ${user.id}(${user.name})</p>
		<a href="#" data-rel="back"
			class="ui-btn ui-corner-all ui-shadow ui-btn-a ui-icon-delete ui-btn-icon-notext ui-btn-right">Close</a>
	</div>
	<div data-role="main">
		<form>
			<input type="hidden" name="sender_uid" value="${user.id}"> <input
				type="hidden" name="receiver_sid" class="seatid">
			<textarea rows="2" cols="70" name="textarea"></textarea>
			<button type="button" name="Nbtn" id="Nbtn"
				onclick="sendMsgImpl(this.form);">보내기</button>
		</form>
	</div>
</div>



