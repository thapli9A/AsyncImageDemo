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
			NavigationLink("PUSH MRE") {
				NewView()
			}
			.buttonStyle(.plain)
			Text(dummyText)
			animationView
			Spacer()
		}
	}

	private var animationView: some View {
		HStack {
			AsyncImage(url: URL(string: url)!)
				.aspectRatio(contentMode: .fit)
				.frame(width: 300, height: 600)
				.clipShape(Rectangle())
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
