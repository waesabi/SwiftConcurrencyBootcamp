//
//  DownloadImageAsync.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Sanket Kumar on 21/06/22.
//

import SwiftUI

class DownloadImageAsyncImageLoader {
	
	func downloadWithEscaping() {
		//TODO: - Complete is later
	}
	
}

class DownloadImageAsyncVM: ObservableObject {
	
	@Published var image: UIImage? = nil
	
	func fetchImage() {
		self.image = .init(systemName: "heart.fill")
	}
	
}

struct DownloadImageAsync: View {
	
	@StateObject var viewModel = DownloadImageAsyncVM()
	
	var body: some View {
		
		ZStack {
			if let image = viewModel.image {
				Image(uiImage: image)
					.resizable()
					.scaledToFit()
					.frame(width: 44, height: 44)
			}
		}
		.onAppear {
			viewModel.fetchImage()
		}
		
	}
}

struct DownloadImageAsync_Previews: PreviewProvider {
	static var previews: some View {
		DownloadImageAsync()
	}
}
