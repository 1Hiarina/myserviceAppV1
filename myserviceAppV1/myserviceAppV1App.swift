import SwiftUI
import StreamChat
import StreamChatSwiftUI

@main
struct MyserviceAppV1: App {
    
    var chatClient: ChatClient = {
        
        var config = ChatClientConfig(apiKey: .init("8br4watad788"))
        config.isLocalStorageEnabled = true
        config.applicationGroupIdentifier = "group.io.getstream.iOS.ChatDemoAppSwiftUI"

        
        let client = ChatClient(config: config)
        return client
    }()
    
    @State var streamChat: StreamChat?
    
    init() {
        streamChat = StreamChat(chatClient: chatClient)
        connectUser()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    private func connectUser() {
        
        let token = try! Token(rawValue: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoibHVrZV9za3l3YWxrZXIifQ.kFSLHRB5X62t0Zlc7nwczWUfsQMwfkpylC6jCUZ6Mc0")
        

        chatClient.connectUser(
            userInfo: .init(
                id: "luke_skywalker",
                name: "Luke Skywalker",
                imageURL: URL(string: "https://vignette.wikia.nocookie.net/starwars/images/2/20/LukeTLJ.jpg")!
            ),
            token: token
        ) { error in
            if let error = error {
                
                log.error("connecting the user failed \(error)")
                return
            }
        }
    }
}

