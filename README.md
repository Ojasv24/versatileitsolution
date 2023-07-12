
# Versatileit Solution
## APK
[app-release.zip](https://github.com/Ojasv24/versatileitsolution/files/12027043/app-release.zip)

## Task
- Created a Flutter app that integrates with the provided webservice.
- Implemented the functionality to check the running status of the app using the CheckAppRunningStatus API.
- Enabled user login using the LoginMember API with the following credentials:
    - User ID: NB3338497 (Encoded: "TkIzMzM4NDk3")
    - Password: 191299 (Encoded: "MTkxMjk5")
    - User ID and Password are encrypted using Base64 encoding.
- Displayed a snackbar if the entered User ID and Password are incorrect.
- After successful login, the app opens the complete web panel within the app.
- Integrated the web panel 
  - URL: www.novabizbusiness.com/Dashboard/MemberLogin.aspx?Auth=UserIdinEncryptedForm&AuthBy=PasswordinEncryptedForm&type=2.
  - i.e : www.novabizbusiness.com/Dashboard/MemberLogin.aspx?Auth=TkIzMzM4NDk3&AuthBy=MTkxMjk5&type=2 (Encoded User ID and Password).
