typedef JsonMap = Map<String, Object?>;
typedef JsonList = List<Object?>;

/// I thought maybe we couldn't use [Object?] as (eg.) the Firebase 
/// [DocumentSnapshot.data()] returns a Map<String, dynamic> but it seems I was 
/// seeign a different error and using Object? works OK... 
/// - is this a downcast? 