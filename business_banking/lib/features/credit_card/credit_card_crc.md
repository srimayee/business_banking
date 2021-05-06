########################
### CreditCardEntity ###
########################

#### Responsibilities
- Contains the basic information about a Credit Card
  - number
  - name
  - lastFour
  - balance
  - paymentDueDate
  - nextClosingDate
  - paymentMinimumValue
  - transactions

#### Collaborators
- None


###########################
### CreditCardViewModel ###
###########################

#### Responsibilities
- Contains the Credit Card information to be shown on the screens
  - number
  - name
  - lastFour
  - balance
  - paymentDueDate
  - nextClosingDate
  - paymentMinimumValue
  - transactions

#### Collaborators
- None


#########################
### CreditCardActions ###
#########################

#### Responsibilities
- Contains the methods that can be called by the screen on every user action.
  - navigateToCreditCardDetails

#### Collaborators
- CreditCardBloc
- CFRouterScope


########################
### CreditCardScreen ###
########################

#### Responsibilities
- Shows the "hub widget" with basic information about the Credit Card
  - Name
  - Last 4 digits
  - Balance
- Uses the information contained at the CreditCardViewModel

#### Collaborators
- CreditCardViewModel
- CreditCardActions


###########################
### CreditCardPresenter ###
###########################

#### Responsibilities
- Builds the CreditCardScreen passing an instance of CreditCardActions using the provided instance of CreditCardBloc.
- Refreshes the CreditCardScreen each time it receives a new instance of CreditCardViewModel from the CreditCardBloc.

#### Collaborators
- CreditCardViewModel
- CreditCardActions
- CreditCardScreen
- CreditCardBloc


########################
### CreditCardWidget ###
########################

#### Responsibilities
- Creates a BlocProvider instance, encapsulating a new instance of CreditCardPresenter
  and a new instance of CreditCardBloc (if not found in the 'context')

#### Collaborators
- BlocProvider
- CreditCardBloc
- CreditCardPresenter


######################
### CreditCardBloc ###
######################

#### Responsibilities
- Provides an instance of Pipe<CreditCardViewEvents>
  used by any Presenter who wishes to send 'CreditCardViewEvents' to the 'bloc'.
- Provides an instance of Pipe<CreditCardViewModel>
  used by any Presenter who wishes to receive CreditCardViewModel updates.
- Calls CreditCardUseCase in order to get an instance of CreditCardViewModel.

#### Collaborators
- CreditCardViewEvents
- CreditCardViewModel
- CreditCardUseCase


#########################
### CreditCardUseCase ###
#########################

#### Responsibilities
- Provides a 'create()' method responsible in creating an CreditCardEntity
  into the repository scope and the ask the repository to execute
  runServiceAdapter passing and instance of CreditCardServiceAdapter
  in order to receive an instance of CreditCardEntity from the server
  and return a new instance of CreditCardViewModel based on the entity received.

#### Collaborators
- CreditCardEntity
- CreditCardServiceAdapter
- CreditCardViewModel
