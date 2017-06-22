class Subject
  def register_observer(observer)
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def remove_observer(observer)
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
  def notify_observers
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
end

class Observer
  def update(args)
    raise NotImplementedError.new("You must implement #{self.class}##{__method__}")
  end
end

class Feed < Subject

  def initialize title
    @title_index = []
    @observers = []

    @title_index << title
  end

  def add_title title
    @title_index << title
  end

  def register_observer(observer)
    @observers << observer
  end

  def remove_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each do |observer|
      observer.update @title_index
    end
  end
end

class User < Observer
  def initialize
    @title_index = []
  end
  def update(title_index)
    # 色々な処理
    @title_index = title_index.dup
  end

  def display_title_index
    puts @title_index
  end
end

goto = User.new
mochizuki = User.new

ferret = Feed.new "hoge" #=> title_indexは　["hoge"]

ferret.register_observer goto

ferret.add_title "fuga" #=> title_indexは　["hoge", "fuga"]

goto.display_title_index #=> []
mochizuki.display_title_index #=> []

ferret.notify_observers 

goto.display_title_index #=> ["hoge", "fuga"]
mochizuki.display_title_index #=> []

ferret.remove_observer(goto)

ferret.add_title "piyo" #=> title_indexは　["hoge", "fuga", "piyo"]

ferret.notify_observers 

goto.display_title_index #=> ["hoge", "fuga"]
mochizuki.display_title_index #=> []
