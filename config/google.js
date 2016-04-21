/**
 * Created by mlavigne on 21/04/2016.
 */
module.exports.google = {

  // 1 - Obtention d'un code : https://accounts.google.com/o/oauth2/auth?redirect_uri=http://localhost:1337/repete/1/upload-enregistrements&response_type=code&client_id=384973764394-kkgm56vp45i0s7ao7ikt4jodgb95cq8a.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&access_type=offline
  // 2 - Échange d'un code contre un token : https://www.googleapis.com/oauth2/v3/token
  client_id: "384973764394-kkgm56vp45i0s7ao7ikt4jodgb95cq8a.apps.googleusercontent.com",
  code: "4/ZTppSwcwbq2NjzmWHFtN0otK8JXpzQP6lP_32tSLLv0#", // reçu à l'étape 1
  "access_token": "ya29..ywJ7IZZ9GKQKrlI-JZe1gn4YOACPrOuq71Narb_l0QSfHp_KQnLJ_P2rXVHblwJmW-eA" // reçu à l'étape 2
  
};
