const std = @import("std");
const build_options = @import("build_options");

pub const discovery = @import("discovery.zig");
pub const face = @import("face.zig");
pub const DeferredFace = @import("DeferredFace.zig");
pub const Face = face.Face;
pub const Group = @import("Group.zig");
pub const GroupCache = @import("GroupCache.zig");
pub const Glyph = @import("Glyph.zig");
pub const Library = @import("Library.zig");
pub const Shaper = @import("Shaper.zig");
pub const Descriptor = discovery.Descriptor;
pub const Discover = discovery.Discover;

/// Build options
pub const options: struct {
    backend: Backend,
} = .{
    .backend = if (build_options.coretext)
        .coretext
    else if (build_options.fontconfig)
        .fontconfig_freetype
    else
        .freetype,
};

pub const Backend = enum {
    /// FreeType for font rendering with no font discovery enabled.
    freetype,

    /// Fontconfig for font discovery and FreeType for font rendering.
    fontconfig_freetype,

    /// CoreText for both font discovery and rendering (macOS).
    coretext,
};

/// The styles that a family can take.
pub const Style = enum(u3) {
    regular = 0,
    bold = 1,
    italic = 2,
    bold_italic = 3,
};

/// The presentation for a an emoji.
pub const Presentation = enum(u1) {
    text = 0, // U+FE0E
    emoji = 1, // U+FEOF
};

test {
    @import("std").testing.refAllDecls(@This());
}
