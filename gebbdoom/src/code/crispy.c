// [crispy] redraw only if necessary
void STlib_drawNum(st_number_t *n, boolean refresh) {

  if (n->oldnum == num && !refresh) {
    return;
  }
  ...
}