<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="theme" tagdir="/WEB-INF/tags/shared/theme"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="common" tagdir="/WEB-INF/tags/desktop/common"%>
<script type="text/javascript" src="${commonResourcePath}/js/acc.countrystate.js"></script>

<style>

.date-purch{
    position: relative;
    top: -7px;
    left: -114px;

}

.supportform-holder{
min-height:250px;
}

.next-ntn{

cursor:pointer;

}

</style>

<div id="askQuestionSupportForm3" class="contentForm ask-q-form"">
<div style="width: 20px; height: 15px" class="item-active-arrow ask-QDetail"></div>
	<div class="question-content">
		<span class="ask-q-close"></span>
		
		<c:url value="/support/${brand}/askquestion" var="technicalAction" />
		<form:form method="post" action="${technicalAction}" id="askTechnicalSupport" commandName="askQuestionSupportTechnicalForm" enctype="multipart/form-data">
			<c:if test="${not empty technicalAccountError or not empty technicalTicketError}">
				<div id="technicalError">
					${technicalAccountError}${technicalTicketError}
				</div> 
			</c:if>
			<input type="hidden" value="${brand}" name="brand">
			<input type="hidden" value="technicalAction" name="itemType">
			<div class="supportFormInfo row supportform-holder" id="askquefrm_${brand}">
			<div id="askQ-toggle">
				<div class="col-xs-6 no-gutter feed-back-left supportFormLeftInfo">
					<div id="enqur_check" class="enqur_check_askqtechsup">
					<div class="rd-set">
					<form:radiobutton path="inquiryType" value="endUser" checked="checked"/>
					<span>I am an End User </span>
					</div>
					<div class="rd-set">
					<form:radiobutton path="inquiryType" value="behalfCompany" id="behalfcompany_askqtechsup"/>
					<span>I am raising the inquiry on behalf of a company</span>
					</div>
					</div>
					
					<form:input path="firstName" placeholder="First Name" readonly="${isLoggedUser}"  maxlength="100" onkeypress="return testSpeaclCharwithoutnums(event)" onpaste="JavaScript:return noSplChar(event);"/>
					<form:errors path="firstName" cssClass="formError" />
					<form:input path="lastName" placeholder="Last Name" readonly="${isLoggedUser}"  maxlength="100" onkeypress="return testSpeaclCharwithoutnums(event)" onpaste="JavaScript:return noSplChar(event);"/>
					<form:errors path="lastName" cssClass="formError" />
					<form:input path="email" placeholder="Email" readonly="${isLoggedUser}"  maxlength="100" />
					<form:errors path="email" cssClass="formError" />
					<form:input path="phone" placeholder="Phone" readonly="${isLoggedUser}"  maxlength="100" />
					<form:errors path="phone" cssClass="formError" />
					<form:input path="skype" placeholder="Skype (Optional)"  maxlength="100" />
					<form:errors path="skype" cssClass="formError" />
					<form:select id="language" path="language" class="custom-select">
						<option selected="selected" disabled="disabled">Select Language</option> 
						<form:options items="${languageRanges}"
							itemValue="${not empty itemValue ? itemValue :'code'}"
							itemLabel="${not empty itemLabel ? itemLabel :'name'}" />
					</form:select>
					<form:errors path="language" cssClass="formError" />
					<!-- country -->
					<form:select path="country" readonly="${isLoggedUser}" class="custom-select">
						<option  selected="selected" disabled="disabled">Country</option>
						<form:options items="${countryList}"
							itemValue="${not empty itemValue ? itemValue :'isocode'}"
							itemLabel="${not empty itemLabel ? itemLabel :'name'}" />
					</form:select>
					
					
					
					<div id="cmpnyshow_askqtechsup" style="display:none">
					<span class="line-behalfcompy"></span>
					<form:input path="companyName" placeholder="Company Name" readonly="${isLoggedUser}"  maxlength="100" />
					<form:errors path="companyName" cssClass="formError" />
					<form:input path="companyPhone" placeholder="Company Phone" readonly="${isLoggedUser}"  maxlength="100" />
					<form:errors path="companyPhone" cssClass="formError" />
					<form:input path="companyWebsite" placeholder="Website" readonly="${isLoggedUser}"  maxlength="100" />
					<form:errors path="companyWebsite" cssClass="formError" />
					<form:input path="companyStreet" placeholder="Street" readonly="${isLoggedUser}"  maxlength="100" />
					<form:errors path="companyStreet" cssClass="formError" />
					<form:input path="companyCity" placeholder="City"  maxlength="100" />
					<form:errors path="companyCity" cssClass="formError" />
					<form:input path="companyZip" placeholder="Zip" readonly="${isLoggedUser}"  maxlength="100" />
					<form:errors path="companyZip" cssClass="formError" />
					<form:select path="compnayCountry" id="compnayCountry" readonly="${isLoggedUser}" class="custom-select">
						<option  selected="selected" disabled="disabled" >Country</option>
						<form:options items="${countryList}"
							itemValue="${not empty itemValue ? itemValue :'isocode'}"
							itemLabel="${not empty itemLabel ? itemLabel :'name'}" />
					</form:select>
					<form:select path="companyState" id="companyState" placeholder="State" class="custom-select">
						<option selected="selected" >State</option>
						<form:options items="${states}"
							itemValue="${not empty itemValue ? itemValue :'isocode'}"
							itemLabel="${not empty itemLabel ? itemLabel :'name'}" />
					</form:select>
					</div>
					
					
					
					
					
					
					<span class="line"></span>
					<form:input path="subject" placeholder="Subject"  maxlength="100" />
					<form:errors path="subject" cssClass="formError" />
					
					<!-- Description -->
					<div class="inputDescription">
						<form:textarea path="description" placeholder="Your question" maxlength="4000"/>
						<form:errors path="description" cssClass="formError"/> </br>
						
					</div>
				</div>
				
				<div class="supportFormRightInfo col-xs-6 no-gutter feed-back-right">
					<!-- Serial number -->
					<div class="inputSerial">
						<form:input path="serialNumber" placeholder="Serial Number" maxlength="255"/>
						
					</div>
					<!-- Model -->
					<!--  
					<div class="inputSerial">
						<form:select id="model" path="model">
							<option value>Model</option>
							<form:options items="${modelList}"
								itemValue="${not empty itemValue ? itemValue :'code'}"
								itemLabel="${not empty itemLabel ? itemLabel :'name'}" />
						</form:select>
					</div>
					-->
					<div id="inputModelContainer">
						<form:input path="model" placeholder="Model" id="askInputModel" />
					</div>
					<span class="noticeText askquestion">${errorModelName}</span>
					
					<span class="line"></span>
					<!-- Other Equipment Connected -->
					<form:input path="equipmentConnected" placeholder="Other Equipment Connected (Optional)"/>
					<form:errors path="equipmentConnected" cssClass="formError" />
					<!-- Software used -->
					<form:input path="softwareUsed" placeholder="Software used"/>
					<form:errors path="softwareUsed" cssClass="formError" />
					<!-- software format -->		
					<form:select id="softwareFormat" path="softwareFormat" class="custom-select">
						<option selected="selected" value="">Software Format</option>
						<form:options items="${softwareFormatList}"
							itemValue="${not empty itemValue ? itemValue :'code'}"
							itemLabel="${not empty itemLabel ? itemLabel :'name'}" />
					</form:select>
					
					<!-- Firmware Version  -->
					<form:input path="firmwareVersion" placeholder="Firmware version"/>
					<form:errors path="firmwareVersion" cssClass="formError" />
					
					
					<div class="date-purcha-label">
					<spring:theme code="support.dateofpurchase"></spring:theme>
					</div>
					
					
					<div class="form-group margin-top-35 margin-bottom-0">
	                	
		                <div class="select-date-askQ">
							<div class="col-xs-3 no-gutter">
								<form:select id="day" path="day" cssClass="form-control custom-select">
									<option value="" disabled="disabled" selected="${empty selectedValue ? 'selected' : ''}"><spring:theme code="register.day" text="Day"/></option>
									<form:options items="${dayRanges}" itemValue="${not empty itemValue ? itemValue :'code'}" itemLabel="${not empty itemLabel ? itemLabel :'name'}"/>
								</form:select>
							</div>
							<div class="pull-left date-separator">-</div>
							<div class="col-xs-4 no-gutter">
								<form:select id="month" path="month" cssClass="form-control custom-select">
								<%-- 	<option value="" disabled="disabled" selected="${empty selectedValue ? 'selected' : ''}"><spring:theme code="register.month" text="Month"/></option> --%>
									<form:options items="${monthRanges}" selected="${empty selectedValue ? 'selected' : ''}" itemValue="${not empty itemValue ? itemValue :'code'}" itemLabel="${not empty itemLabel ? 10 :'name'}"/>
								</form:select>
							</div>
							<div class="pull-left date-separator">-</div>
							<div class="col-xs-4 no-gutter">
								<form:select id="year" path="year" cssClass="form-control custom-select">
									<option value="" disabled="disabled" selected="${empty selectedValue ? 'selected' : ''}"><spring:theme code="register.year" text="Year"/></option>
									<form:options items="${yearRanges}" itemValue="${not empty itemValue ? itemValue :'code'}" itemLabel="${not empty itemLabel ? itemLabel :'name'}"/>
								</form:select>
							</div>
		              		<div class="clear-fix"></div>
		              		<c:set var="monthErrors"><form:errors path="month"/></c:set>
		                	<c:set var="dayErrors"><form:errors path="day"/></c:set>
		                	<c:set var="yearErrors"><form:errors path="year"/></c:set>
			                <c:if test="${not empty monthErrors}">								
			                  <form:errors path="month" cssClass="form_field_error d-m-y"/>
			                </c:if>							
			                <c:if test="${ empty monthErrors && not empty dayErrors }">
			                  <form:errors path="day" cssClass="form_field_error d-m-y"/>
			                </c:if>							
			                <c:if test="${ empty monthErrors &&  empty dayErrors && not empty yearErrors}">
			                  <form:errors path="year" cssClass="form_field_error d-m-y"/>
			                </c:if>
		              	</div>
		              	
		              	<span class="noticeText askquestion">${errorDOP}</span>
		            </div> 
					
					
					
					
					
					
					
					<!-- File Attachment -->					
                   
                    <%-- <div class="attach-file-wrapper">
	                    <p class="attach-file">
	                    <input id="uploadFile" type="text" disabled="disabled" placeholder="Proof of Purchase Attachment">
	                    </p>
	                    <div class="file-upload btn btn-primary"><span>Upload</span><br> 
	                    	<!-- <input class="upload" id="uploadBtn" type="file"> -->
	                    	<form:input path="attachFile" type="file" class="upload" id="uploadBtn" />		
	                    </div>			
					</div>
				
					<span style="display: block; clear: both;"> <br /> <br />
						<button class="form btn-b2bsupport" name="Submit">Submit</button>
					</span> --%>
					
					<%-- <div class="fieldAttachFile">
						<form:label for="attachFile" path="attachFile" class="nameFileAttach" id="attachFile">Proof of Purchase Attachment</form:label>
            			<form:input path="attachFile" type="file" class="attachFile" id="getFile"/>
					 </div>	 --%>	
					  <p class="field-attach-label">
            			 <spring:theme code="support.attachfiles.label"></spring:theme>
            			</p>
					 <div class="form-group margin-top-35 margin-bottom-0">	
					 <div class="fieldAttachFile">
					 
					 
						<!--<form:label for="attachFile" path="attachFile" class="nameFileAttach" id="attachFile">Attach File</form:label>
	                    <form:input path="attachFile" type="file"  multiple="" name="files[]" class="attachFile" id="getFile"/>-->
	                    
	                   
						<form:label for="attachFile" path="attachFile" class="nameFileAttach" id="attachFileLabel">Attach File</form:label>
            			<!--<form:input path="attachFile" type="file" class="attachFile" id="getFile"/>-->
            			<input name='uploads1' type="file" class="attachFile" id="getFile" multiple>
            			<label class="btnUploadFile">Upload</label>
            			
            			
            			<!-- <input name='uploads1' type="file" class="attachFile" id="getFile" multiple> -->
            			
            			
					 </div>
					</div>	 
					 <p class="attach-note">
            			 <spring:theme code="support.attachfiles.note"></spring:theme>
            			</p>
					 
									 
					<ul id="fileList"></ul>
					
					
					
				</div>
			</div>	
			<div class="askQuestionTechNext" style="display:none">
			<p class="askQuestionlabelheading">
				<spring:theme code="support.technical.faultAnalysis.heading"/>
			</p>
		<div class="row-askquestion">		
			<div class="askQleftpart col-xs-6">
			<p class="fault-label">
				<spring:theme code="support.technical.faultAnalysis"/>
			</p>
			  <div class=""><spring:theme code="support.technical.faultAnalysis.Q1"/></div>
				
				<div class="checkYesNo">
				<div class="childRadio">
				 <form:radiobutton class="askquestionradio radio-inline" path="faultAnalysisQ1" value="Yes"  label="Yes" id="employsRadio1" checked="checked" />
				</div>
				
				<div class="childRadio">
				 <form:radiobutton class="askquestionradio radio-inline" path="faultAnalysisQ1" value="No" label="No" id="employsRadio2" />
				 </div>
				 </div>
				 
				
				
				<div class="inputDescription">
				<p class="askquestion-next-label"><spring:theme code="support.technical.faultAnalysis.Q2"/></p>
				
				<div class="askquestionpfail">
				<div class="childRadio">
				 <form:radiobutton class="askquestionradio" path="faultAnalysisQ2opt" value="At the distributor"  label="At the distributor" checked="checked"/>
				</div>
				<div class="childRadio">
				 <form:radiobutton class="askquestionradio" path="faultAnalysisQ2opt" value="On tour"  label="On tour"/>
				</div>
				<div class="childRadio">
				 <form:radiobutton class="askquestionradio" path="faultAnalysisQ2opt" value="Installed"  label="Installed"/>
				</div>
				<div class="childRadio">
				 <form:radiobutton class="askquestionradio" path="faultAnalysisQ2opt" value="Others"  label="Others-Please specify:" id="faultAnalysisQ2others"/>
				</div>
				</div>
				
						<form:textarea path="faultAnalysisQ2" readonly="true" placeholder="Your question" maxlength="4000"/>
						<form:errors path="description" cssClass="formError"/> 						
				</div>
				
				<c:choose>
				
				 <c:when test="${brand == 'turbosound'}">
				
				
				<p class="askquestion-next-label"><spring:theme code="support.technical.faultAnalysis.Q3"/><span class="img-pt">*</span></p>
					<form:input path="faultAnalysisQ3" placeholder="" readonly="${readonly}" maxlength="100" />
				<p class="askquestion-next-label"><spring:theme code="support.technical.faultAnalysis.Q3.note"/></p>
			</div>
			
			<div class="askQrightpart col-xs-6">	
				<p class="askquestion-next-label"><spring:theme code="support.technical.faultAnalysis.Q4"/><span class="img-pt">*</span></p>
					<form:input path="faultAnalysisQ4" placeholder="" readonly="${readonly}" maxlength="100" />
				
				<p class="askquestion-next-label"><spring:theme code="support.technical.faultAnalysis.Q5"/><span class="img-pt">*</span></p>
					<form:input path="faultAnalysisQ5" placeholder="" readonly="${readonly}" maxlength="100" />
				
				  <div class="no-gutter"><spring:theme code="support.technical.faultAnalysis.Q6"/></div>
				
				
				<div class="checkYesNo">
				<div class="childRadio">
				 <form:radiobutton class="askquestionradio radio-inline" path="faultAnalysisQ6" value="true"  label="Yes" id="faultAnalysisQ51" checked="checked" />
				</div>
				
				<div class="childRadio">
			      <form:radiobutton class="askquestionradio radio-inline" path="faultAnalysisQ6" value="false" label="No" id="faultAnalysisQ52" />
				 </div>
				
				 </div>
				
					<form:textarea path="faultAnalysisQ6Text" placeholder="Text" maxlength="4000"/>
						<form:errors path="faultAnalysisQ6Text" cssClass="formError"/> 
				 
				
				
				  <div class=" no-gutter"><spring:theme code="support.technical.faultAnalysis.Q7"/></div>
				
				
				<div class="checkYesNo">
				<div class="childRadio">
				 <form:radiobutton class="askquestionradio radio-inline" path="faultAnalysisQ7" value="true"  label="bridged mono" id="faultAnalysisQ71" checked="checked" />
			
				
				<div class="childRadio">
			     <form:radiobutton class="askquestionradio radio-inline" path="faultAnalysisQ7" value="false" label="stereo/mono" id="faultAnalysisQ72" />
				 </div>
				 </div>

				 
				</div>
				
				<p class="askquestion-next-label"><spring:theme code="support.technical.faultAnalysis.Q8"/><span class="img-pt">*</span></p>
					<form:input path="faultAnalysisQ8" placeholder="" readonly="${readonly}" maxlength="100" />
				
				<p class="askquestion-next-label"><spring:theme code="support.technical.faultAnalysis.Q9"/><span class="img-pt">*</span></p>
					<form:input path="faultAnalysisQ9" placeholder="" readonly="${readonly}" maxlength="100" />
				
				
				
			</c:when>
			</c:choose>
				 
			</div>	
			</div>
				 </div>	
				<button class="form btn-b2bsupport" name="Submit" style="display:none">Submit</button> 
					
			 	<span class="next-ntn btn-b2bsupport" id="btn-b2bsupportNxt">
			 	
			 	Next
			 	
			 	</span>
			 	
		
			 	
			
			</div>
		</form:form>
		<div class="feedback-result1-tech askquestion-result-popup" id=feedback-result-popup1>${result.content}
	
		</div>
	</div>
</div>
<script type="text/javascript">
     //add to accept number only`
   	$("body").on("keyup", "input[name=companyPhone]", function (event) {
   		var input = $(event.target);
   		if (!$.isNumeric(input.val()) || Math.floor(input.val()) != input.val() || input.val().indexOf('.') >=0) {
   			input.val('');
   		    return;
   	    }
   		
   	});
     
   	$('.askquestionpfail input').on('change', function(){
   		
   	 	if($('#faultAnalysisQ2others').is(':checked')) {
   	 		
   	 		$("#faultAnalysisQ2others").closest(".askquestionpfail").next().removeAttr('readonly');
   	 	}
   	 	
   	 	
   	 
   	 	else{
   	 		
   	 	   $("#faultAnalysisQ2others").closest(".askquestionpfail").next().attr('readonly','readonly');
   	 		
   	 	}
   	 	
   	})
     
</script>

