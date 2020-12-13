# [목차](#목차)
- [목차](#목차)
- [회원가입, 로그인 기능 구현](#회원가입-로그인-기능-구현)
  - [1.1 회원가입 기능](#11-회원가입-기능)
    - [1.1.1 정리](#111-정리)
  - [1.2. 로그인 기능](#12-로그인-기능)

# 회원가입, 로그인 기능 구현

## 1.1 회원가입 기능
```text
- jsp를 이용하여 구현하기
- 회원가입과 로그인 기능을 만들고 데이터를 form tag를 이용하여 서버에게 전송이 목적이다.
- 회원가입 시, 메인 페이지로 이동된다.
```

- 회원가입 페이지

![](https://images.velog.io/images/withcolinsong/post/96af47a9-8b33-4297-a53b-dcc126ebbf10/ezgif.com-gif-maker%20(3).gif)

- 데이터 저장 후, 콘솔창에서 데이터가 제대로 들어왔는지 확인

![](https://images.velog.io/images/withcolinsong/post/04d2dea6-39f6-4fc7-b1c2-a33a77249794/image.png)

### 1.1.1 정리

1. HOME -> index.jsp
2. 유저가 요청한 form -> userjoin.jsp
3. 서버가 사용자 정보를 저장 -> form.jsp
4. User.java
   - 서버가 사용자의 정보를 저장할 때 필요한 정보들을 class로 만들어 타입이 다른 각각의 정보들을 `private` 멤버 필드로 저장. 
   - 사용자의 정보를 받아서 저장할 수 있도록 생성자를 만든다.

5. Database.java
    - 사용자의 정보를 맵구조를 사용하여 저장한다.
    - addUser() 메서드를 만들어서, 매개변수를 User로 받아서 저장한다.

6. form.jsp 로직 추가
    - User.java, Database.java를 임포트한다.
    - 데이터 저장
    - 로그인 후 index.jsp로 이동 -> response.sendRedirect("경로");

## 1.2. 로그인 기능



