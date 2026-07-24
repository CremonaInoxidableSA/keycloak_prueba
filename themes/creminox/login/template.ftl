<!DOCTYPE html>
<html class="login-pf">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><#if pageTitle>${pageTitle}<#else>Keycloak</#if></title>
    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <#if properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/css/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/js/${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>
<body class="login-pf-body">
    <div class="login-pf-page">
        <div id="kc-container" class="login-pf-container">
            <div id="kc-header" class="login-pf-header">
                <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">
                    <#if realm.displayNameHtml?has_content>
                        ${realm.displayNameHtml}
                    <#else>
                        ${realm.displayName}
                    </#if>
                </div>
            </div>
            <div class="card-pf login-pf">
                <#nested>
            </div>
        </div>
    </div>
</body>
</html>