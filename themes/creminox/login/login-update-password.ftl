<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password-new','password-confirm'); section>
    <#if section = "header">
        ${msg("updatePasswordTitle")}
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-change-password-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <label for="password-new" class="${properties.kcLabelClass!}">
                            ${msg("Nueva contraseña")}
                        </label>
                        <input type="password" id="password-new" name="password-new" class="${properties.kcInputClass!}" autocomplete="new-password" />
                        <#if messagesPerField.existsError('password-new')>
                            <span id="input-error-password-new" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                <@translateFieldError messagesPerField.get('password-new') />
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <label for="password-confirm" class="${properties.kcLabelClass!}">
                            ${msg("Confirmar nueva contraseña")}
                        </label>
                        <input type="password" id="password-confirm" name="password-confirm" class="${properties.kcInputClass!}" autocomplete="new-password" />
                        <#if messagesPerField.existsError('password-confirm')>
                            <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                <@translateFieldError messagesPerField.get('password-confirm') />
                            </span>
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <button type="submit" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="submitAction" value="Submit">${msg("GUARDAR")}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
