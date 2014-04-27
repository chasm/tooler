User.destroy_all

users = User.create([
  {
    email: "tom@example.com"
  },
  {
    email: "dick@example.com"
  },
  {
    email: "harry@example.com"
  }
])

tools = Tool.create([
  {
    name: "Hammer",
    category: "Hand tools",
    description: "If I had a hammer...",
    user: users[0]
  },
  {
    name: "Screwdriver",
    category: "Hand tools",
    description: "Gimme a screwdriver...",
    user: users[1]
  },
  {
    name: "Wrench",
    category: "Hand tools",
    description: "Throw a wrench in the works...",
    user: users[1]
  },
  {
    name: "Pliers",
    category: "Hand tools",
    description: "I'm not that pliable...",
    user: users[2]
  },
  {
    name: "Chain saw",
    category: "Power tools",
    description: "Bzzzzzzzzz",
    user: users[0]
  },
  {
    name: "Pneumatic drill",
    category: "Power tools",
    description: "Brrrrrrrrrr...",
    user: users[2]
  }
])
