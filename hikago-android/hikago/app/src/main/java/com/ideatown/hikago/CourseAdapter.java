package com.ideatown.hikago;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;

/**
 * Adapter convert data to listview that has been customed.
 */
public class CourseAdapter extends ArrayAdapter {

    private Object[] courseDump;
    public CourseAdapter(Context context, int resource, Object[] objects) {
        super(context, resource, objects);
        courseDump = objects;
    }

    public CourseAdapter(Context context, int resource) {
        super(context, resource);
    }

    @Override
    public int getCount() {
        return courseDump.length;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        return LayoutInflater.from(getContext()).inflate(R.layout.list_item_course, parent, false);
    }
}
