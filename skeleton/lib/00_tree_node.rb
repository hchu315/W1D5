class PolyTreeNode
require 'byebug'
  attr_accessor :children
  attr_reader :parent, :value
  
  def initialize(value)
    @parent = nil 
    @children = []
    @value = value
  end 
  
  
  def parent 
    @parent 
  end 
  
  
  def children 
    @children
  end 
  
  def value
    @value
  end 
  
  def parent=(parent)
    if parent.nil?
      @parent = parent
    elsif @parent.nil?
      @parent = parent 
      @parent.children << self
    elsif @parent != parent
      @parent.children.delete(self)
      @parent = parent
      @parent.children << self
    end
  end 
      
  def add_child(child_node)
    child_node.parent = self
  end
  
  def remove_child(child_node)
    raise 'error' unless @children.include?(child_node)
    child_node.parent = nil
  end
  
  def dfs(target_value) #stack/lIFO
    return self if target_value == @value 

    @children.each do |child|
      temp = child.dfs(target_value)
      return temp unless temp.nil?
    end
    nil
  end

  def bfs(target_value) #queue/FIFO
    node_children = [self]
    # debugger
    # dup_children = @children.dup
    # i = 0
    # while i < dup_children.length
    #   temp = dup_children[i].bfs(target_value)
    #   return temp unless temp.nil?  
    #   dup_children.concat(dup_children[i].children)
    #   i +=1
    # end
    
    until node_children.empty?
      temp = node_children.shift 
      
      return temp if target_value == temp.value
      node_children += temp.children
    end
    nil
  end
end