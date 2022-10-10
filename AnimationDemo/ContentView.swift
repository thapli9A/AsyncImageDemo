//
//  ContentView.swift
//  AnimationDemo
//
//  Created by Abhishek Thapliyal on 10/10/22.
//

import SwiftUI

struct ContentView: View {

	let url = "https://raw.githubusercontent.com/thapli9A/AsyncImageDemo/main/Images/img101.png"

    var body: some View {
		NavigationView {
			VStack {
				Spacer()
				NavigationLink("PUSH MRE") {
					NewView()
				}
				.buttonStyle(.plain)
				animationView
				Spacer()
			}
		}
    }

	private var animationView: some View {
		HStack {
			AsyncImage(url: URL(string: url)!)
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
