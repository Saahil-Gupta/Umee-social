class UserProfile {
    final String name;
    final String bio;
    final String imageUrl;

    UserProfile({
        required this.name,
        required this.bio,
        required this.imageUrl,
    });
}

final List<UserProfile> mockMatchers = [
    UserProfile(
        name: "Anya",
        bio: "Love beaches, sunsets and reading books",
        imageUrl: 'https://randomuser.me/api/portraits/women/64.jpg',
    ),
    UserProfile(
        name: "Peter",
        bio: "I'm a history nerd who loves weightlifting",
        imageUrl: 'https://randomuser.me/api/portraits/men/72.jpg',
    ),
    UserProfile(
        name: "Ashley",
        bio: "Gamer | F1 Fan | Weeb",
        imageUrl: 'https://randomuser.me/api/portraits/women/37.jpg',
    ),
    UserProfile(
        name: "Trent",
        bio: "I'm a professional cricket and soccer player. Hmu if you want to play",
        imageUrl: 'https://randomuser.me/api/portraits/men/45.jpg',
    ),
    UserProfile(
        name: "Hermione",
        bio: "Never let me stay away from my daily coffee and code",
        imageUrl: 'https://randomuser.me/api/portraits/women/22.jpg',
    ),
    UserProfile(
        name: "Gwen",
        bio: "Big fan of CAS and Hozier",
        imageUrl: 'https://randomuser.me/api/portraits/women/32.jpg',
    ),
];