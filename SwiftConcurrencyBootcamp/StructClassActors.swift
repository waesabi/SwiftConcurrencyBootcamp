//
//  StructClassActors.swift
//  SwiftConcurrencyBootcamp
//
//  Created by Sanket Kumar on 21/06/22.
//

import SwiftUI

struct StructClassActors: View {
	var body: some View {
		
		Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
			.onAppear {
				runTest()
			}
	}
}


extension StructClassActors {
	
	func runTest() {
		print("Test case running")
		structTest1()
		printDivider()
		classTest1()
		printDivider()
		actorTest1()
	}
	
	func printDivider() {
		print(
			"""
			-------------------
			"""
		)
	}
	
	func structTest1() {
		let objectA = MyStruct(title: "Starting title!")
		print("ObjectA: \(objectA.title)")
		
		var objectB = objectA
		print("ObjectB: \(objectB.title)")
		
		objectB.title = "Second title!"
		print("ObjectB title updated")
		print("ObjectA: \(objectA.title)")
		print("ObjectB: \(objectB.title)")
	}
	
	private func classTest1() {
		let objectA = MyClass(title: "Starting title!")
		print("ObjectA: \(objectA.title)")
		
		let objectB = objectA
		print("ObjectB: \(objectB.title)")
		
		objectB.title = "Second title!"
		
		print("ObjectB title updated")
		print("ObjectA: \(objectA.title)")
		print("ObjectB: \(objectB.title)")
	}
	
	private func actorTest1() {
		print("actorTest1")
		Task {
			let objectA = MyActor(title: "Starting title!")
			print("ObjectA: \(await objectA.title)")
			
			let objectB = objectA
			print("ObjectB: \(await objectB.title)")
			
			await objectB.updateTitle(newTitle: "Second title!")
			
			print("ObjectB title updated")
			print("ObjectA: \(await objectA.title)")
			print("ObjectB: \(await objectB.title)")
		}
	}
}

extension StructClassActors {
	
	func structTest2() {
		print("structTest2")
		var struct1 = MyStruct(title: "Title1")
		print("Struct1: \(struct1.title)")
		struct1.title = "Title2"
		print("Struct1: \(struct1.title)")
		
		var struct2 = CustomStruct(title: "Title1")
		print("struct2: \(struct2.title)")
		
		struct2 = CustomStruct(title: "Title2")
		print("struct2: \(struct2.title)")
		
		var struct3 = CustomStruct(title: "Title1")
		print("struct3: \(struct3.title)")
		struct3 = struct3.updateTitle(newTitle: "Title2")
		print("struct3: \(struct3.title)")
		
		var struct4 = MutatingStruct(title: "Title1")
		print("struct4: \(struct4.title)")
		struct4.updateTitle(newTitle: "Title2")
		print("struct4: \(struct4.title)")
	}
	
}

struct MyStruct {
	var title: String
}



struct CustomStruct {
	let title: String
	
	func updateTitle(newTitle: String) -> CustomStruct {
		CustomStruct(title: newTitle)
	}
}

struct MutatingStruct {
	private(set) var title: String
	
	mutating func updateTitle(newTitle: String) {
		self.title = newTitle
	}
}

class MyClass {
	var title: String
	
	init(title: String) {
		self.title = title
	}
	
	func updateTitle(newTitle: String) {
		self.title = newTitle
	}
}

actor MyActor {
	var title: String
	
	init(title: String) {
		self.title = title
	}
	
	func updateTitle(newTitle: String) {
		self.title = newTitle
	}
}


extension StructClassActors {
	
	private func classTest2() {
		print("classTest2")
		let class1 = MyClass(title: "Title1")
		print("class1: \(class1.title)")
		
		class1.title = "Title2"
		print("class1: \(class1.title)")
		
		let class2 = MyClass(title: "Title1")
		print("class2: \(class2.title)")

		class2.updateTitle(newTitle: "Title2")
		print("class2: \(class2.title)")
		
	}
	
}


struct StructClassActors_Previews: PreviewProvider {
	static var previews: some View {
		StructClassActors()
	}
}
