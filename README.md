## JDS Bank system (Fintech Nomination of BFA)

+ Technologies: NodeJs (NestJs) 
  + NodeJs (Nest) - for backend
  + Flutter - for Android and iOS
  + Mysql (TypeORM) - for database
  
Use Cases
- Create virtual visa card
- Activate and Deactivate virtual visa cards
- Sending SMS about events (Would be done using Telegram because we would not have time to buy and set up sms gateways)  
- Giving Cashbacks when done payment by clients
- Getting comission from Merchants when done payment
- Storing transactions

Modules
- Card
  - Create card
  - Get balance
  - Get cashback
  - Get balance
  - Activate card
  - Deactivate card
- Transaction
  - Transfer money
  - Deposit money
  - Get list of all transfer of card
- Merchant
  - Pay for goods
  - Check card information
  - Get list of pays of goods
  - Get comission when done payment

## How to run ?

- Running the Backend
  - Install NodeJS
  - Just run `npm install` so it can install all required packages from package.json
  - Install docker and run mysql container
  - Enter project root folder and run ```nest start```
  - If you dont see any erros then project started
- Client (Mobile application)
  - Install flutter
  - Run `flutter build apk` to create android application
  
Ready, You can ask me questions about how to run this project by contacting me at https://t.me/shjavohir


  