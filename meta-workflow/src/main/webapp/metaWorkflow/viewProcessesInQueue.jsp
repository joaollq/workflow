<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-html" prefix="html" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-bean" prefix="bean" %>
<%@ taglib uri="http://jakarta.apache.org/struts/tags-logic" prefix="logic" %>
<%@ taglib uri="http://fenix-ashes.ist.utl.pt/fenix-renderers" prefix="fr"%>


<h2><bean:message key="title.processPerQueue" bundle="META_WORKFLOW_RESOURCES"/></h2>


<ul>
	<li>
		<html:link page="/metaWorkflow.do?method=viewOpenProcessesInMyQueues">
			<bean:message key="link.back" bundle="MYORG_RESOURCES"/>
		</html:link>	
	</li>
</ul>

<bean:define id="state" value='<%=  request.getParameter("active") != null ? request.getParameter("active").toString() : "all" %>'/>
<bean:define id="queueId" name="queue" property="externalId" type="java.lang.String"/>

<span>
	<logic:equal name="state" value="all">
		<bean:message key="link.queue.allProcess" bundle="META_WORKFLOW_RESOURCES"/> | 
		<html:link page="<%= "/metaWorkflow.do?method=viewProcessInQueue&active=true&queueId=" +  queueId %>" > <bean:message key="link.queue.activeProcessesOnly" bundle="META_WORKFLOW_RESOURCES"/> </html:link>
		| <html:link page="<%= "/metaWorkflow.do?method=viewProcessInQueue&active=false&queueId=" +  queueId %>" >  <bean:message key="link.queue.notActiveProcessesOnly" bundle="META_WORKFLOW_RESOURCES"/> </html:link>
	</logic:equal>

	<logic:equal name="state" value="true">
		<html:link page="<%= "/metaWorkflow.do?method=viewProcessInQueue&queueId=" +  queueId %>" > <bean:message key="link.queue.allProcess" bundle="META_WORKFLOW_RESOURCES"/> </html:link> | 
		<bean:message key="link.queue.activeProcessesOnly" bundle="META_WORKFLOW_RESOURCES"/>
		| <html:link page="<%= "/metaWorkflow.do?method=viewProcessInQueue&active=false&queueId=" +  queueId %>" >  <bean:message key="link.queue.notActiveProcessesOnly" bundle="META_WORKFLOW_RESOURCES"/> </html:link>
	</logic:equal>
	
	<logic:equal name="state" value="false">
		<html:link page="<%= "/metaWorkflow.do?method=viewProcessInQueue&queueId=" +  queueId %>" > <bean:message key="link.queue.allProcess" bundle="META_WORKFLOW_RESOURCES"/> </html:link> | 
		<html:link page="<%= "/metaWorkflow.do?method=viewProcessInQueue&active=true&queueId=" +  queueId %>" >  <bean:message key="link.queue.activeProcessesOnly" bundle="META_WORKFLOW_RESOURCES"/> </html:link>
		| <bean:message key="link.queue.notActiveProcessesOnly" bundle="META_WORKFLOW_RESOURCES"/> 
	</logic:equal>

</span>


<h3 class="mtop15 mbottom075"><fr:view name="queue" property="name"/></h3>

<logic:notEmpty name="displayProcesses">
		<div>
			<fr:view name="displayProcesses" schema="view.metaProcesses.list.withState">
				<fr:layout name="tabular">
					<fr:property name="classes" value="tstyle3"/>
				</fr:layout>
			</fr:view>
		</div>
</logic:notEmpty>
	
<logic:empty name="displayProcesses">
	<em><bean:message key="label.queue.noProcessesForFilter" bundle="META_WORKFLOW_RESOURCES"/></em>
</logic:empty>
