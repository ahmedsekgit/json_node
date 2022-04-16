==============================
 How to pass a map from controller to javascript function in  VF page  
==============================
public String getButtonNameMap() {   Map<String, Id> buttonNameMap = new Map<String, Id>();   for(LiveChatButton chatButton:[SELECT DeveloperName FROM LiveChatButton WHERE DeveloperName =:buttonNamesSet LIMIT :Limits.getLimitQueryRows() - Limits.getQueryRows()] ) {     buttonNameMap.put(chatButton.DeveloperName,chatButton.Id);     }    return JSON.serialize(buttonNameMap); }
  
==============================
250 at  2021-10-29T15:22:52.000Z
==============================
