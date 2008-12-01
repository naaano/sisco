<%@ page language="c#" inherits="vcglock.pfedocs.pages.clientefirmante.FirmarDocumento, App_Web_ovplwusl" %>
<%@ Register TagPrefix="uc1" TagName="Top" Src="../Top.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Menu" Src="../Menu.ascx" %>
<%@ Register TagPrefix="uc1" TagName="Bottom" Src="../Bottom.ascx" %>
<uc1:top id="Top2" runat="server"></uc1:top>
<SCRIPT language="JavaScript">
	function firmar(){
		var ok;
		
		if (typeof(document.PFEDocForm.clienteObj) != "undefined" && !document.PFEDocForm.firmarBtn.disabled){
			document.PFEDocForm.firmarBtn.disabled = true;
			document.PFEDocForm.volverBtn.disabled = true;
			ok = document.PFEDocForm.clienteObj.executeFirmar();
			if (ok){
				window.location = 'ConfirmacionFirma.aspx?IdDoc=<%=Request["IdDoc"]%>'
			}else{
				document.PFEDocForm.firmarBtn.disabled = false;
				document.PFEDocForm.volverBtn.disabled = false;
			}
		}else{
			alert("Control de Firmar Documentos no existe en p�gina")
		}
	}
	
	function volver(){
		window.location = "../GenerarDocumento.aspx"
	}
	
</SCRIPT>
<table cellSpacing="0" cellPadding="0" width="750" border="0">
	<tr>
		<td vAlign="top" align="center" width="665" bgColor="#ffffff">
			<div id="content">
				<form id="PFEDocForm" method="post" runat="server">
					<table cellSpacing="0" cellPadding="0" width="99%" bgColor="#ffffff" border="0">
						<tr>
							<td valign="top"><img src="../gui/img/titulo_firmar_documento.jpg"></td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="center">
							<% String creds = Convert.ToBase64String(System.Text.Encoding.Default.GetBytes("dom=minrel;user=pfe;psw=pfe2")); %>
								<OBJECT id="clienteObj" name="clienteObj" classid="http:<%=clienteFirmanteUrl%>#pfe.cliente.ClienteFirmante" VIEWASTEXT>
									<param name="VerifyCRL" value="yes" />
									<param name="XmlUrl" value="http://<%=host+appPath%>/pages/ClienteFirmante/GenerarXMLFirmar.aspx?addFirma=<%=addFirma%>&IdDoc=<%=IdDoc%>&oldId=<%=oldId%>" />
									<param name="UploadUrl" value="http://<%=host+appPath%>/pages/ClienteFirmante/GuardarXMLFirmado.aspx?addFirma=<%=addFirma%>&IdDoc=<%=IdDoc%>&oldId=<%=oldId%>" />
									<param name="CredencialUrl" value="http://<%=host+appPath%>/pages/ClienteFirmante/GenerarXmlCredenciales.aspx?IdFirmador=<%=userId%>" />
									<param name="Credenciales" value='<%=creds%>'/>
								</OBJECT>
							</td>
						</tr>
						<tr>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td align="center">
								<a href="Volver.html" onClick="volver();return false;"><img name="volverBtn" src="../gui/img/boton_volver.jpg" alt="Volver" border="0"></a>&nbsp;
								<a href="Firmar.html" onClick="firmar();return false;"><img name="firmarBtn" src="../gui/img/boton_firmar.jpg" alt="Firmar" border="0"></a>
							</td>
						</tr>
					</table>
				</form>
			</div>
		</td>
<uc1:menu id="Menu1" runat="server"></uc1:menu>
	</tr>
	<tr>
		<td height="15" colspan="2" valign="top"><img src="../gui/img/borde_inf.jpg" width="675" height="15"></td>
	</tr>
</table>
<uc1:bottom id="Bottom1" runat="server"></uc1:bottom>
