/**
 * Created by mlavigne on 21/04/2016.
 */
module.exports.google = {

  // 1 - Obtention d'un code : https://accounts.google.com/o/oauth2/auth?redirect_uri=http://localhost:1337/repete/1/upload-enregistrements&response_type=code&client_id=384973764394-kkgm56vp45i0s7ao7ikt4jodgb95cq8a.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&access_type=offline
  // 2 - Échange d'un code contre un token : https://www.googleapis.com/oauth2/v3/token
  "client_id": "384973764394-kkgm56vp45i0s7ao7ikt4jodgb95cq8a.apps.googleusercontent.com",
  "project_id": "roadie-1238",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://accounts.google.com/o/oauth2/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_secret": "Y4EFeXZozYQyIP0troNs3QMU",
  "scope": "https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/drive",

  "Clé API": "AIzaSyCxSmQGKZ9sEr5dfr6RtlRPpvr0_Tls-6w",

  "redirect_path" : "/google/token"

};
