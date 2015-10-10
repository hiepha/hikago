package com.ideatown.hikago;


import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ListView;

/*
    Fragment will show all course that users have registered
 */
public class MyCourseFragment extends Fragment {

    private CourseAdapter courseAdapter;

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        courseAdapter = new CourseAdapter(getActivity(), R.layout.list_item_course, new Object[10]);
        View view = inflater.inflate(R.layout.mycourse_fragment, container, false);
        ListView courseListView = (ListView) view.findViewById(R.id.listview_mycourses);
        courseListView.setAdapter(courseAdapter);

        courseListView.setOnItemClickListener(new AdapterView.OnItemClickListener() {

            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {
                Intent intentDetail = new Intent(getActivity(), CourseDetailActivity.class);
                startActivity(intentDetail);
            }

        });
        return view;
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater inflater) {
        inflater.inflate(R.menu.menu_my_course, menu);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        return super.onOptionsItemSelected(item);
    }
}
