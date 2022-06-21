//
//  DoCatchTryThrows.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Sanket Kumar on 21/06/22.
//

import SwiftUI


class DoCatchTryThrowsDataManaer {
	let isActive = true
	
	func getTitle() -> (title: String?, error: Error?) {
		if isActive {
			return ("New Text", nil)
		} else {
			return (nil, URLError(.badURL))
		}
	}
	
	func getTitle2() -> Result<String, Error> {
		if isActive {
			return .success("New Text")
		} else {
			return .failure(URLError(.appTransportSecurityRequiresSecureConnection))
		}
	}
	
	func getTitle3() throws -> String {
		if isActive {
			return "Get Title3 Succeed"
		} else {
			throw URLError(.badServerResponse)
		}
	}
	
}

class DoCatchTryThrowsVM: ObservableObject {
	
	@Published var text = "Starting text."
	let manager = DoCatchTryThrowsDataManaer()
	
	func fetchTitle() {
//		let title = manager.getTitle()
//		if let text = title.title {
//			self.text = text
//		} else if let error = title.error {
//			self.text = error.localizedDescription
//		}
		
//		let result = manager.getTitle2()
//		switch result {
//		case .success(let success):
//			self.text = success
//		case .failure(let failure):
//			self.text = failure.localizedDescription
//		}
		
		do {
			let newTitle = try manager.getTitle3()
			self.text = newTitle
		} catch {
			self.text = error.localizedDescription
		}
	}
	
}

struct DoCatchTryThrows: View {
	
	@StateObject var viewModel = DoCatchTryThrowsVM()
	
    var body: some View {
        
		Text(viewModel.text)
			.frame(width: 300, height: 300)
			.background(Color.blue)
			.onTapGesture {
				viewModel.fetchTitle()
			}
    }
}

struct DoCatchTryThrows_Previews: PreviewProvider {
    static var previews: some View {
        DoCatchTryThrows()
    }
}
