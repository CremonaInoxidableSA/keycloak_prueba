<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displaySocialProviders?? displayWatermark=false>
    <div id="kc-error-message">
        <p class="instruction">${message.summary}</p>
        <#if message.detail??>
            <p class="error-details">${message.detail}</p>
        </#if>
    </div>
    <div class="form-group">
        <a href="${url.loginUrl}" class="btn btn-primary">${msg("backToLogin")}</a>
    </div>
</@layout.registrationLayout>
