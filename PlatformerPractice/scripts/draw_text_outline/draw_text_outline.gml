// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

// @param x
// @param y
// @param text
// @param xscale
// @param yscale
// @param col_text
// @param col_outline
function draw_text_outline()
{
var xx = argument0;
var yy = argument1;
var txt = argument2;
var scx = argument3;
var scy = argument4;
var col_main = argument5;
var col_out = argument6;

// Outline thickness
var o = 2;

// Draw outline
draw_set_color(col_out);
draw_text_transformed(xx - o, yy,     txt, scx, scy, 0);
draw_text_transformed(xx + o, yy,     txt, scx, scy, 0);
draw_text_transformed(xx,     yy - o, txt, scx, scy, 0);
draw_text_transformed(xx,     yy + o, txt, scx, scy, 0);

// Main text
draw_set_color(col_main);
draw_text_transformed(xx, yy, txt, scx, scy, 0);
}