<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displaySocialProviders displayWatermark=false>
    <div id="kc-form" <#if realm.password && realm.registrationAllowed>class="login-pf-signup"</#if>>
        <div id="kc-form-wrapper">
            <#if realm.password>
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <div class="${properties.kcFormGroupClass!}">
                        <label for="username" class="${properties.kcLabelClass!}">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                        </label>

                        <#if usernameEditingDisabled??>
                            <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                        <#else>
                            <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" />
                        </#if>
                    </div>

                    <div class="${properties.kcFormGroupClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                        <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                    </div>

                    <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                        <div id="kc-form-options">
                            <#if realm.rememberMe && !usernameEditingDisabled??>
                                <div class="checkbox">
                                    <label>
                                        <#if login.rememberMe??>
                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                        <#else>
                                            <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                        </#if>
                                    </label>
                                </div>
                            </#if>
                            </div>
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                                <#if realm.resetPasswordAllowed>
                                    <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div>

                        </div>

                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential>value="${auth.selectedCredential}"</#if>/>
                        <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                    </div>
                </form>
            </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="login-pf-signup">
                <span>${msg("identity-provider-login-label")}</span>
                <div class="${properties.kcSocialProvidersClass!}">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" class="${properties.kcSocialProviderButtonClass!} ${properties.kcButtonClass!} ${properties.kcButtonSecondaryClass!}" type="button" href="${p.loginUrl}">
                            <span class="${properties.kcIconClass!} ${properties.kcIconSocialProviderClass!} ${p.providerId}"></span>
                            <span class="pf-v5-c-button__text">${p.displayName}</span>
                        </a>
                    </#list>
                </div>
            </div>
        </#if>
    </div>
</@layout.registrationLayout>
                    </div>
                </form>
            </#if>
        </div>
        <#if realm.password && social.providers??>
            <div id="kc-social-providers" class="login-pf-signup">
                <span>${msg("identity-provider-login-label")}</span>
                <div class="${properties.kcSocialProvidersClass!}">
                    <#list social.providers as p>
                        <a id="social-${p.alias}" class="${properties.kcSocialProviderButtonClass!} ${properties.kcButtonClass!} ${properties.kcButtonSecondaryClass!}" type="button" href="${p.loginUrl}">
                            <span class="${properties.kcIconClass!} ${properties.kcIconSocialProviderClass!} ${p.providerId}"></span>
                            <span class="pf-v5-c-button__text">${p.displayName}</span>
                        </a>
                    </#list>
                </div>
            </div>
        </#if>
    </div>
</@layout.registrationLayout>