/* 
Copyright (c) 2019 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Repo : Decodable {
	let id : Int?
	let node_id : String?
	let name : String?
	let full_name : String?
	let owner : Owner?
	let html_url : String?
	let description : String?
	let fork : Bool?
	let url : String?
	let created_at : String?
	let updated_at : String?
	let git_url : String?
	let ssh_url : String?
	let clone_url : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case node_id = "node_id"
		case name = "name"
		case full_name = "full_name"
		case owner = "owner"
		case html_url = "html_url"
		case description = "description"
		case fork = "fork"
		case url = "url"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case git_url = "git_url"
		case ssh_url = "ssh_url"
		case clone_url = "clone_url"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		node_id = try values.decodeIfPresent(String.self, forKey: .node_id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		full_name = try values.decodeIfPresent(String.self, forKey: .full_name)
		owner = try values.decodeIfPresent(Owner.self, forKey: .owner)
		html_url = try values.decodeIfPresent(String.self, forKey: .html_url)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		fork = try values.decodeIfPresent(Bool.self, forKey: .fork)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		created_at = try values.decodeIfPresent(String.self, forKey: .created_at)
		updated_at = try values.decodeIfPresent(String.self, forKey: .updated_at)
		git_url = try values.decodeIfPresent(String.self, forKey: .git_url)
		ssh_url = try values.decodeIfPresent(String.self, forKey: .ssh_url)
		clone_url = try values.decodeIfPresent(String.self, forKey: .clone_url)
	}

}
