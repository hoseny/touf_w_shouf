import 'package:hive/hive.dart';
import 'package:touf_w_shouf/features/home/data/models/program_model.dart';

class WishlistService {
  static const _boxName = 'wishlist';

  /// Ensure the box is open
  static Box<ProgramModel> get _box => Hive.box<ProgramModel>(_boxName);

  /// Load all saved programs
  static List<ProgramModel> loadWishlist() {
    return _box.values.toList();
  }

  /// Add or update a program (keyed by its `code`)
  static Future<void> addProgram(ProgramModel program) async {
    // Using `code` as the key ensures no duplicates
    await _box.put(program.code, program);
  }

  /// Remove by `code`
  static Future<void> removeProgram(int code) async {
    await _box.delete(code);
  }

  /// Clear entire wishlist
  static Future<void> clearWishlist() async {
    await _box.clear();
  }
}
