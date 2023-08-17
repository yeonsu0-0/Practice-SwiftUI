//
//  ScrumStore.swift
//  SwiftUI-essentials
//
//  Created by yeonsu on 2023/08/17.
//

import SwiftUI


@MainActor  // 메인 스레드에서의 동작을 보장
class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = []
    
    // 유저의 문서 폴더에서 데이터를 불러오고 저장
    // FileManager를 통해 폴더 경로를 가져옴
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrums.data")
    }
    
    // ✅ Load Data(decode)
    // scrums.data 파일에서 JSON 데이터를 불러와 일일 스크럼 배열로 디코딩하는 메서드
    func load() async throws {
        let task = Task<[DailyScrum], Error> {
            let fileURL = try Self.fileURL()
            // 처음 앱을 구동했을 때는 데이터가 비어있기 때문에 Optional로 선언
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: data)
            return dailyScrums
        }
        // await 키워드를 이용해서 작업이 끝날 때까지 기다렸다가 scrums 변수에 값 할당
        let scrums = try await task.value
        self.scrums = scrums
    }
    
    // ✅ Save Data(encode)
    func save(scrums: [DailyScrum]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(scrums)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
