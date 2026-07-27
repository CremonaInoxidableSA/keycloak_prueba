<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username') displayInfo=realm.duplicateEmailsAllowed; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">
                            <#if !realm.loginWithEmailAllowed>${msg("Usuario")}<#elseif !realm.registrationEmailAsUsername>${msg("Usuario o correo")}<#else>${msg("Correo")}</#if>
                        </label>
                        <input type="text" id="username" name="username" class="${properties.kcInputClass!}" value="${(auth.attemptedUsername!'')}" autofocus autocomplete="username" />
                        <#if messagesPerField.existsError('username')>
                            <span id="input-error-username" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('username'))?no_esc}
                            </span>
                        </#if>
                    </div>
                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Submit">${msg("ENVIAR")}</button>
                        </div>
                    </div>
                    <div id="kc-reset-info" class="${properties.kcFormGroupClass!}">
                        <div id="kc-reset-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                            ${msg("emailInstruction")}
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info">
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
