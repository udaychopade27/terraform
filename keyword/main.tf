#concat(list1, list2, ...): Combines multiple lists into a single list.
variable "list1" {
  type    = list
  default = ["a", "b"]
}

variable "list2" {
  type    = list
  default = ["c", "d"]
}

output "combined_list" {
  value = concat(var.list1, var.list2)
}

#length(list) : to find number of elements in a list 
variable "my_list" {
    type = list
    default = ["apple", "banana", "cherry"]
}

output "length" {
    value = length(var.my_list)
}


#element(list, index):  it will return the elemnts of index given 
variable "my_list1" {
  type    = list
  default = ["apple", "banana", "cherry"]
}

output "selected_element" {
  value = element(var.my_list1, 1) # Returns "banana"
}

#zipmap(key, value): Creates a map from a list of keys and a list of values.
variable "keys" {
  type    = list
  default = ["name", "age"]
}

variable "values" {
  type    = list
  default = ["Alice", 30]
}

output "my_map" {
  value = zipmap(var.keys, var.values) # Returns {"name" = "Alice", "age" = 30}
}

