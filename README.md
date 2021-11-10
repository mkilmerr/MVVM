# MVVM Design Pattern in iOS :metal:


## MVVM ( Model-ViewModel- Model )


## MVVM Flow

1. ViewController / View will have a reference to the ViewModel
2. ViewController / View get some ***user action*** and will call ***ViewModel***
3. ViewModel request some API Service and API Service will sends a response to ViewModel
4. ViewModel will notifies the ViewController / View with binding
5. The ViewController / View will update the UI with data


![1_8MiNUZRqM1XDtjtifxTSqA](https://user-images.githubusercontent.com/34096743/141125060-b219cac2-0295-421f-bcb7-cbea1aff449e.png)
