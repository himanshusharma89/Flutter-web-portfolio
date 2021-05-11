class SocialPlatformsItem {
  const SocialPlatformsItem(
      {required this.icon, required this.title, required this.onTap});

  final String title;
  final String icon;
  final void Function() onTap;
}
