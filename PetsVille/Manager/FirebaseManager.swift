import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

func signInWithEmail(email: String, password: String,
                     completion: @escaping (Bool, String) -> Void)
{

    Auth.auth().signIn(withEmail: email, password: password) { res, err in
        if err != nil {
            completion(false, (err?.localizedDescription)!)
            return
        }
        completion(true, (res?.user.email)!)
    }
}

func signUpWithEmail(email: String, password: String,completion: @escaping (Bool, String) -> Void)
{

    Auth.auth().createUser(withEmail: email, password: password) { res, err in
        if err != nil {
            completion(false, (err?.localizedDescription)!)
            return
        }
        completion(true, (res?.user.email)!)
    }
}

func faceBookLogin(accessToken: String){
    let credential = FacebookAuthProvider.credential(withAccessToken: accessToken)
    Auth.auth().signIn(with: credential) { authResult, error in
        if let error = error {
            print("Facebook Login error")
            print(error)
            return
        }
        print("Facebook Login done")
        print(authResult!)
        if let user = Auth.auth().currentUser{
            print("CurrentUser")
            print(user)
        }
    }
    
}
