# Property Wrappers
변화가 생기면 해당 변수의 값을 읽거나 새로 쓸 수 있다

![property wrapper](https://docs-assets.developer.apple.com/published/9f2fc96909be0a02360bae191821501f/SUI045_001@2x.png)

### @State
- 속성을 @State로 선언하고, 사용자 액션으로 인해 @State 속성이 변경되는 경우 시스템은 해당 속성에 종속된 모든 뷰를 업데이트하여 새 버전의 사용자 인터페이스를 렌더링한다.
- State 속성 값이 변경되면 시스템은 업데이트된 속성 값을 사용하여 뷰를 자동으로 다시 그린다.  
- State 속성으로 어떤 프로퍼티의 초기값을 지정한 경우 다른 값으로 재할당 불가하며 @Binding 변수를 통해서만 가능하다.
#


  
  
    
    
![property wrapper](https://docs-assets.developer.apple.com/published/f33892ca6c740c2fe9b6054410d878e5/SUI045_002@2x.png)

### @Binding
- @Binding으로 선언한 속성은 @State 속성과 같이 기존 데이터 소스와 읽기 및 쓰기 액세스 권한을 공유한다. 
- 바인딩은 데이터를 직접 저장하지 않는다. 대신 기존 데이터 원본과 해당 데이터를 표시하고 업데이트하는 뷰 간에 양방향 링크를 만든다. 이 연결을 통해 한 데이터와 연결된 여러 뷰가 동기화된다.
- 사용 시 변수명 앞에 $를 붙인다.  
#

