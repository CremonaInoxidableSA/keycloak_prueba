<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('email') displayInfo=realm.duplicateEmailsAllowed; section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-reset-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <label for="email" class="${properties.kcLabelClass!}">
                            <#if !realm.loginWithEmailAllowed>${msg("Usuario")}<#elseif !realm.registrationEmailAsUsername>${msg("Usuario o correo")}<#else>${msg("Correo")}</#if>
                        </label>
                        <input type="text" id="email" name="email" class="${properties.kcInputClass!}" value="${(auth.attemptedUsername!'')}" autofocus autocomplete="email" />
                        <#if messagesPerField.existsError('email')>
                            <span id="input-error-email" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('email'))?no_esc}
                            </span>
                        </#if>
                    </div>
                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Submit">${msg("ENVIAR")}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info">
        ${msg("emailInstruction")}
    </#if>
</@layout.registrationLayout>
