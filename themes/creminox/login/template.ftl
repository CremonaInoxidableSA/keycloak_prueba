<#import "footer.ftl" as loginFooter>
<#import "theme-resources.ftl" as themeResourceTags>

<#-- MACRO PARA TRADUCIR MENSAJES DEL SERVIDOR -->
<#macro translateMessage message>
    <#if message?has_content>
        <#local translated = message>
        <#-- Traducir mensajes comunes del servidor -->
        <#if message?contains("Invalid username or password")>
            <#local translated = "Usuario o contraseña inválidos">
        <#elseif message?contains("You should receive an email shortly with further instructions")>
            <#local translated = "Deberías recibir un correo en breve con más instrucciones">
        <#elseif message?contains("You need to change your password to activate your account")>
            <#local translated = "Necesitas cambiar tu contraseña para activar tu cuenta">
        <#elseif message?contains("Your login attempt timed out")>
            <#local translated = "Tu intento de inicio de sesión caducó. El inicio de sesión comenzará desde el principio">
        <#elseif message?contains("Link expired")>
            <#local translated = "El enlace ha caducado">
        <#elseif message?contains("Invalid code")>
            <#local translated = "Código inválido">
        <#elseif message?contains("Please specify password")>
            <#local translated = "Por favor, especifique la contraseña.">
        <#elseif message?contains("Please specify username")>
            <#local translated = "Por favor, especifique el usuario o correo.">
        <#elseif message?contains("Password confirmation does not match")>
            <#local translated = "La confirmación de contraseña no coincide">
        <#elseif message?contains("Passwords don't match")>
            <#local translated = "Las contraseñas no coinciden">
        <#elseif message?contains("Invalid email address")>
            <#local translated = "Dirección de correo inválida">
        <#elseif message?contains("User exists with same username")>
            <#local translated = "Ya existe un usuario con este nombre">
        <#elseif message?contains("User exists with same email")>
            <#local translated = "Ya existe un usuario con este correo">
        <#elseif message?contains("Please specify username or password")>
            <#local translated = "Por favor, especifique usuario o contraseña">
        <#elseif message?contains("Account is not fully set up")>
            <#local translated = "La cuenta no está completamente configurada">
        <#elseif message?contains("Account disabled")>
            <#local translated = "La cuenta ha sido deshabilitada">
        <#elseif message?contains("Account temporarily disabled")>
            <#local translated = "La cuenta está temporalmente deshabilitada">
        </#if>
        ${translated}
    </#if>
</#macro>

<#-- MACRO PARA TRADUCIR ERRORES DE VALIDACIÓN DE CAMPOS -->
<#macro translateFieldError error>
    <#if error?has_content>
        <#local translated = error>
        <#if error?contains("Invalid username or password")>
            <#local translated = "Usuario o contraseña inválidos">
        <#elseif error?contains("Please specify password")>
            <#local translated = "Por favor, especifique la contraseña.">
        <#elseif error?contains("Please specify username")>
            <#local translated = "Por favor, especifique el usuario o correo.">
        <#elseif error?contains("Password confirmation does not match")>
            <#local translated = "La confirmación de contraseña no coincide">
        <#elseif error?contains("Passwords don't match")>
            <#local translated = "Las contraseñas no coinciden">
        <#elseif error?contains("Invalid email address")>
            <#local translated = "Dirección de correo inválida">
        </#if>
        ${translated}
    </#if>
</#macro>

<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}" lang="${lang!'en'}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${title!}</title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">

<div class="${properties.kcLoginClass!}">
    <div class="${properties.kcFormCardClass!}">
        <div class="kc-logo-creminox"></div>
        
        <header class="${properties.kcFormHeaderClass!}">
            <h1 id="kc-page-title"><#nested "header"></h1>
        </header>

        <div id="kc-content">
            <div id="kc-content-wrapper">
                <#if displayMessage && message?has_content>
                    <div class="alert-${message.type} ${properties.kcAlertClass!} pf-m-<#if message.type = 'error'>danger<#else>${message.type}</#if>">
                        <div class="pf-c-alert__icon">
                            <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                            <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                            <#if message.type = 'error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                            <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                        </div>
                        <span class="${properties.kcAlertTitleClass!}"><@translateMessage message.summary /></span>
                    </div>
                </#if>

                <#nested "form">

                <#nested "socialProviders">

                <#if displayInfo>
                    <div id="kc-info" class="${properties.kcSignUpClass!}">
                        <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                            <#nested "info">
                        </div>
                    </div>
                </#if>
            </div>
        </div>

        <@loginFooter.content/>
    </div>
</div>

</body>
</html>
</#macro>
