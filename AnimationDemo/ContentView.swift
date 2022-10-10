//
//  ContentView.swift
//  AnimationDemo
//
//  Created by Abhishek Thapliyal on 10/10/22.
//

import SwiftUI

struct ContentView: View {

	@State var dummyText = "asddadas"
	@State var refreshMe = false
	let url = "https://raw.githubusercontent.com/thapli9A/AsyncImageDemo/main/Images/img101.png"

	var body: some View {
		NavigationView {
			parentView
				.navigationBarTitleDisplayMode(.inline)
				.onAppear {
					dummyText += "\(dummyText.count)"
					refreshMe.toggle()
				}
		}
	}

	private var parentView: some View {
		VStack {
			Spacer()
			NavigationLink("PUSH ME") {
				NewView()
			}
			Text(dummyText)
				.onTapGesture {
					print("CALLL CLAL")
					refreshMe.toggle()
				}
			animationView
			Spacer()
		}
		.accentColor(refreshMe ? .black : .black)
	}

	private var animationView: some View {
		HStack {
			AsyncImage(url: URL(string: url)) { phase in
				switch phase {
				case .empty:
					ProgressView()
				case .success(let image):
					image.resizable()
						.aspectRatio(contentMode: .fit)
						.frame(maxWidth: 300, maxHeight: 450)
				case .failure:
					Image(systemName: "photo")
				@unknown default:
					Color.red
				}
			}
			.padding(.horizontal, 50)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

struct NewView: View {
	var body: some View {
		Text("CHECk")
	}
}
