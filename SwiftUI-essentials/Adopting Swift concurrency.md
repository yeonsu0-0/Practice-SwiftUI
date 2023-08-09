# Adopting Swift concurrency

>  **✅ 목표:** Swift로 비동기 함수를 정의하고 호출하는 방법과 비동기 연산을 간소화 하는 방법 알아보기

## Updating the user interface

@State, @Binding 속성을 사용하여 사용자 인터페이스를 데이터 모델과 동기화되도록 했다. 이러한 속성 변경 코드는 뷰를 업데이트하기 때문에 메인 스레드에서 실행되어야 한다. 비동기 함수는 백그라운드 스레드에서 실행될 수 있기 때문에 이러한 함수에서 속성을 수정하면 문제가 발생할 수 있다.
<br />
**@MainActor** 를 클래스 선언에 적용하면 모든 프로퍼티 변경이 메인 스레드에서 처리되도록 할 수 있다.
```Swift
@MainActor // Mutations of the users property will occur on the main actor.  
class UserStore: ObservableObject {
     @Published var users: [UserRecord] = []

  func refresh() async {
     let participants = await fetchParticipants()
     let records = await fetchRecords(participants: participants)
     self.users = records  
   }  
   func fetchParticipants() async -> [Participant] { return [] }
   func fetchRecords(participants: [Participant]) async -> [UserRecord] { return [] }  }
```
<br />


## Simplifying asynchronous code

SwiftUI 앱에서는 메인 스레드가 모든 UI 작업을 수행한다. 또한 메인 스레드가 Tap, Swipe 같은 모든 유저 이벤트를 전달한다. 정확한 동작을 위해서는 모든 뷰의 업데이트와 이벤트 핸들러가 메인 스레드에서 작동해야 한다.  <br />
하지만 너무 많은 작업을 메인 스레드가 담당하면 앱이 느려지게 만들기 때문에, 필요할 때 메인 스레드에서 실행되도록 하되, 가능하다면 백그라운드 스레드에서 동작하도록 하는 것이 좋다.


## Defining an asynchronous function

**async** 키워드를 함수의 매개변수 뒤, 또는 반환 화살표 (->) 앞에 붙일 수 있다.
```Swift
final class UserStore {  func fetchParticipants() async -> [Participant] {...}  }
```
<br />

##  Calling an asynchronous function

**await** 키워드를 통해 비동기 함수를 호출할 수 있다. 비동기 함수는 실행을 일시 중단할 수 있기 때문에 다른 비동기 함수의 내부와 같은 비동기 컨텍스트에서만 사용할 수 있다.
```Swift
final class UserStore {
  func refresh() async -> [UserRecord] {
  let participants = await fetchParticipants()
  let records = await fetchRecords(participants: participants)
  return records  }
  func fetchParticipants() async -> [Participant] {...}
  func fetchRecords(participants: [Participant]) async -> [UserRecord] {...}  }
```
await 키워드를 사용하면 fetchParticipants()가 완료될 때까지 함수 실행을 일시중지할 수 있다. 함수가 일시중지되는 동안 함수를 실행하는 스레드는 다른 작업을 수행할 수 있다. fetchParticipants()가 완료되면 refresh() 함수의 실행을 재개한다. <br  />
다음 함수인 fetchRecords(participants:)는 fetchParticipants()의 반환값을 사용할 수 있다. <br  />
비동기 함수를 사용하면 함수가 코드에 표시되는 순서대로 실행된다.
<br  />

## Creating an asynchronous context

비동기 함수를 호출하려면 함수 호출이 비동기 컨텍스트 내에 있어야 한다. 대부분의 코드에서 비동기 컨텍스트는 비동기 함수 또는 클로저의 본문이다. 위의 refresh() 함수는 refresh()를 비동기 함수로 선언했기 때문에 두 개의 비동기 함수를 호출할 수 있었다. <br />
만약 동기 컨텍스트에서 비동기 함수를 호출하고 싶다면 **Task**와 함께 새로운 비동기 컨텍스트를 만들면 된다. 버튼 내부에서 refresh() 함수를 사용하려면 아래 코드와 같이 Task를 생성하고 Task 내부에서 비동기 함수를 호출하면 된다.
```Swift
struct RefreshButton: View {
@Binding var model: ViewModel
   var body: some View {
       Button("Refresh") {
         // Can't call asynchronous functions directly inside the button action.
         Task {
             // Task provides an asynchronous context inside the closure.
             await model.refresh()
         }
      }
   }
```
<br  />