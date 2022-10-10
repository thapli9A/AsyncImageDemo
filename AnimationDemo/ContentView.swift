//
//  ContentView.swift
//  AnimationDemo
//
//  Created by Abhishek Thapliyal on 10/10/22.
//

import SwiftUI

struct ContentView: View {

	@State var dummyText = "asddadas"
	let url = "https://raw.githubusercontent.com/thapli9A/AsyncImageDemo/main/Images/img101.png"

	init() {

	}

    var body: some View {
		NavigationView {
			parentView
				.navigationBarTitleDisplayMode(.inline)
				.onAppear {
					dummyText += "\(dummyText.count)"
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
			animationView
			Spacer()
		}
	}

	private var animationView: some View {
		HStack {
			AsyncImage(url: URL(string: url)) { image in
				image.resizable()
			} placeholder: {
				ProgressView()
			}
			.frame(width: 250, height: 480)
		}
		.padding(.horizontal, 50)
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
