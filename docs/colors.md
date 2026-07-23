# Mhpan Color System

The Mhpan desktop uses **Atelier Estuary Dark** as its primary color palette.

---

## Philosophy

The palette is built around muted natural tones with a strong green accent.

Goals:

- Comfortable for long development sessions.
- Low eye strain.
- Consistent across every application.
- Laptop-first experience.

---

# Base Palette

| Name | Hex |
|------|------|
| Base00 | `#22221b` |
| Base01 | `#302f27` |
| Base02 | `#5f5e4e` |
| Base03 | `#6c6b5a` |
| Base04 | `#878573` |
| Base05 | `#929181` |
| Base06 | `#e7e6df` |
| Base07 | `#f4f3ec` |
| Base08 | `#ba6236` |
| Base09 | `#ae7313` |
| Base0A | `#a5980d` |
| Base0B | `#7d9726` |
| Base0C | `#5b9d48` |
| Base0D | `#36a166` |
| Base0E | `#5f9182` |
| Base0F | `#9d6c7c` |

---

# System Roles

| Role | Color |
|------|------|
| Background | `#22221b` |
| Panel | `#302f27` |
| Selected | `#5f5e4e` |
| Text | `#929181` |
| Heading | `#e7e6df` |
| Accent | `#36a166` |
| Border | `#6c6b5a` |
| Muted | `#878573` |
| Success | `#7d9726` |
| Info | `#5b9d48` |
| Warning | `#ae7313` |
| Error | `#ba6236` |

---

# Rules

- Never invent random colors.
- Every component should use this palette.
- Accent color should remain consistent across the entire desktop.
- Borders should use the Border role.
- Backgrounds should use Background or Panel.
- Error, Warning and Success colors should only communicate status.

---

# Components

The following components must follow this color system:

- Niri
- Kitty
- Waybar
- Mako
- Fastfetch
- Cava
- Starship
- Neovim
- GTK Theme