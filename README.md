# CryptoNiteIO Features and Concept 

-- Working --- 
- Functional . Crypto Stock extension (like Apples stock widget)
- Touch  Graph displaying current btc price andh last 24h 
- Notification system
- Background fetch setup


-- Future -- 
- Follow Clean Arhictecture convention 
- Displays percent changes in price
- Fetch and Display more Crypto Currencies 
- Notifies if price changes over 5 % 


--- Misssing ---    
    //1. Model (Implemented)
    //2. Make API request -> Store in dict<> (Implemented) 
    //3. Update request and Compare with Cached Prev. Price 
    //4. Display price is going down or up in percentage
    //5. Notfiy settings for user, 4 levels , + adding sound. 
   
  
  
 ---> Instructions <---  
  
 (Bitcoin Version) 
  -> All logic -> Viewcontroller 
  -> Using CryptoCurrencyKit Framework for fetchign price and use LineChartView 
  
 -----------------------------------------------------------------------------
  -> Idea is to follow with other cryptocurrency using specific API data 
  -> With independendt Clean Architecture
   -----------------------------------------------------------------------------
