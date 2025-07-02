class UserProfile {
    final String name;
    final String bio;
    final String imageUrl;
    final List<String>? communities;

    UserProfile({
        required this.name,
        required this.bio,
        required this.imageUrl,
        this.communities,
    });
}

final List<UserProfile> mockMatchers = [
    UserProfile(
        name: "Anya",
        bio: "Love beaches, sunsets and reading books",
        imageUrl: 'assets/images/woman1.jpg',
        communities: ['Goldie\'s Gym', 'Sam\'s Book Club'],
    ),
    UserProfile(
        name: "Peter",
        bio: "I'm a history nerd who loves weightlifting",
        imageUrl: 'assets/images/man1.jpg',
        communities: ['Anytime Fitness Center']
    ),
    UserProfile(
        name: "Ashley",
        bio: "Gamer | F1 Fan | Weeb",
        imageUrl: 'assets/images/woman2.jpg',
    ),
    UserProfile(
        name: "Trent",
        bio: "I'm a professional cricket and soccer player. Hmu if you want to play",
        imageUrl: 'assets/images/man2.jpg',
    ),
    UserProfile(
        name: "Hermione",
        bio: "Never let me stay away from my daily coffee and code",
        imageUrl: 'assets/images/woman3.jpg',
        communities: ['Anytime Fitness Center'],
    ),
    UserProfile(
        name: "Gwen",
        bio: "Big fan of CAS and Hozier",
        imageUrl: 'assets/images/woman4.jpg',
    ),
];